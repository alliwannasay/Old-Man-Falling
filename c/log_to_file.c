/*
 * (c) 2008-2011 Daniel Halperin <dhalperi@cs.washington.edu>
 */
#include <arpa/inet.h>
#include <sys/socket.h>
#include <linux/socket.h>
#include <linux/netlink.h>
#include <linux/connector.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <signal.h>
#include <unistd.h>

#define MAX_PAYLOAD 2048
#define SLOW_MSG_CNT 1
#define WINDOW_WIDTH 500

// struct cn_msg
// {
// 	struct cb_id		id;

// 	__u32			seq;
// 	__u32			ack;

// 	__u32			len;		/* Length of the following data */
// 	__u8			data[0];
// };

struct cmsg_loop
{
	struct cn_msg cmsg;
	struct cmsg_loop* next;
};
struct cmsg_loop* create_cml();

int sock_fd = -1;							// the socket
FILE* out = NULL;

void check_usage(int argc, char** argv);

FILE* open_file(char* filename, char* spec);

void close_file();

void caught_signal(int sig);

void exit_program(int code);
void exit_program_err(int code, char* func);

void num_to_str(int num, char* str);

int main(int argc, char** argv)
{
	/* Local variables */
	struct sockaddr_nl proc_addr, kern_addr;	// addrs for recv, send, bind
	struct cn_msg *cmsg;
	//struct cmsg_loop *cml_head = create_cml();

	char buf[4096];
	int ret;
	unsigned short l, l2;
	int count = 0;

	//have fun
	char filenameBase[100];
	char filenameFull[100];
	int fileNum = 0;
	char filenameNum[10];
	char *catStr = "_";
	char *filenameExt = ".dat";
	strcpy(filenameBase, argv[1]);



	/* Make sure usage is correct */
	check_usage(argc, argv);

	/* Open and check log file */
	//out = open_file(argv[1], "w");

	/* Setup the socket */
	sock_fd = socket(PF_NETLINK, SOCK_DGRAM, NETLINK_CONNECTOR);
	if (sock_fd == -1)
		exit_program_err(-1, "socket");

	/* Initialize the address structs */
	memset(&proc_addr, 0, sizeof(struct sockaddr_nl));
	proc_addr.nl_family = AF_NETLINK;
	proc_addr.nl_pid = getpid();			// this process' PID
	proc_addr.nl_groups = CN_IDX_IWLAGN;
	memset(&kern_addr, 0, sizeof(struct sockaddr_nl));
	kern_addr.nl_family = AF_NETLINK;
	kern_addr.nl_pid = 0;					// kernel
	kern_addr.nl_groups = CN_IDX_IWLAGN;

	/* Now bind the socket */
	if (bind(sock_fd, (struct sockaddr *)&proc_addr, sizeof(struct sockaddr_nl)) == -1)
		exit_program_err(-1, "bind");

	/* And subscribe to netlink group */
	{
		int on = proc_addr.nl_groups;
		ret = setsockopt(sock_fd, 270, NETLINK_ADD_MEMBERSHIP, &on, sizeof(on));
		if (ret)
			exit_program_err(-1, "setsockopt");
	}

	/* Set up the "caught_signal" function as this program's sig handler */
	signal(SIGINT, caught_signal);

	/* Poll socket forever waiting for a message */
	while (1)
	{
		if (count % WINDOW_WIDTH == 0)
		{
			// open a file
			strcpy(filenameFull, filenameBase);
			strcat(filenameFull, catStr);
			num_to_str(fileNum, filenameNum);
			strcat(filenameFull, filenameNum);
			strcat(filenameFull, filenameExt);
			out = open_file(filenameFull, "w");
		}
		
		/* Receive from socket with infinite timeout */
		ret = recv(sock_fd, buf, sizeof(buf), 0);
		if (ret == -1)
			exit_program_err(-1, "recv");
		/* Pull out the message portion and print some stats */
		cmsg = NLMSG_DATA(buf);
		if (count % SLOW_MSG_CNT == 0)
			printf("received %d bytes: id: %d val: %d seq: %d clen: %d\n", cmsg->len, cmsg->id.idx, cmsg->id.val, cmsg->seq, cmsg->len);
		/* Log the data to file */
		l = (unsigned short) cmsg->len;
		l2 = htons(l);
		fwrite(&l2, 1, sizeof(unsigned short), out);
		ret = fwrite(cmsg->data, 1, l, out);
		if (count % 100 == 0)
			printf("wrote %d bytes [msgcnt=%u]\n", ret, count);
		++count;
		if (ret != l)
			exit_program_err(1, "fwrite");

		if (count % WINDOW_WIDTH == 0)
		{
			//close the file
			close_file();
			fileNum++;
		}
	}

	exit_program(0);
	return 0;
}

struct cmsg_loop* create_cml()
{
    struct cmsg_loop *head;
    struct cmsg_loop *p1,*p2;
    int n = 1;
    p1 = p2 = (struct cmsg_loop *)malloc(sizeof(struct cmsg_loop));
    head = NULL;
    while (n < WINDOW_WIDTH)
    {
        n++;
        if (n == 1)
        {
        	head=p1;
        }
        else 
        {
        	p2->next = p1;
        }
        p2 = p1;
        p1 = (struct cmsg_loop *)malloc(sizeof(struct cmsg_loop));
    }
    p1->next = head;
    return head;
}

void num_to_str(int num, char* str)
{
	sprintf(str, "%09d", num); 
}

void check_usage(int argc, char** argv)
{
	if (argc != 2)
	{
		fprintf(stderr, "Usage: log_to_file <output_file>\n");
		exit_program(1);
	}
}

FILE* open_file(char* filename, char* spec)
{
	FILE* fp = fopen(filename, spec);
	if (!fp)
	{
		perror("fopen");
		exit_program(1);
	}
	return fp;
}

void close_file()
{
	if (out)
	{
		fclose(out);
		out = NULL;
	}
}

void caught_signal(int sig)
{
	fprintf(stderr, "Caught signal %d\n", sig);
	exit_program(0);
}

void exit_program(int code)
{
	if (out)
	{
		fclose(out);
		out = NULL;
	}
	if (sock_fd != -1)
	{
		close(sock_fd);
		sock_fd = -1;
	}
	exit(code);
}

void exit_program_err(int code, char* func)
{
	perror(func);
	exit_program(code);
}
