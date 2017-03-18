function LOF
clc
clear
fileOrder=1;
%��ȡԭʼ����
x=readFile(fileOrder);
K=10;
%�����ݲ���
count=1;%outlier�����
x=opeData(x,count,fileOrder);
[m,n]=size(x);
%% ���������֮�����
for i=1:m
    for j=i:m
        dist(i,j)=abs(x(i)-x(j));
        dist(j,i)=dist(i,j);
    end
end

%% ���Ĳ��֣���ÿ����ֱ����LOFֵ
for i=1:m
    %����k-distance
    [distance,num]=sort(dist(i,:),'ascend');
    kdistance=distance(K+1);
    %����
    pointArray(i,:)=num(2:K+1);
    %   �Լ�����ÿ�������ɴ����
    n=size(pointArray,2);
    for j=1:n
        d(i,j)=distance(j+1);
        [distemp,numtemp]=sort(dist(i,:),'ascend');
        kdistemp=distemp(K+1);
        kdis(j)=kdistemp;
        %�ɴ����
        reachdis(i,j)=max(d(i,j),kdis(j));
    end
    sum_reachdis=0;
    for j=1:n
        sum_reachdis=sum_reachdis+reachdis(i,j);
    end
    %����ÿ�����lrd
    lrd(i)=n/sum_reachdis;
end
%% �õ�lofֵ
for i=1:m
    sumlrd=0;
    for j=1:n
        sumlrd=sumlrd+lrd(j)/lrd(i);
    end
    lof(i)=sumlrd/n;
end
%%��ͼ
subplot(2,1,1)
plot(1:size(x,1),x,'-b.','linewidth',2,'markersize',14.5);
legend('ԭʼ����');
title('LOF����Ч��ͼ');
set(legend,'location','best');
subplot(2,1,2)
plot(1:size(lof,2),lof,'-r.','linewidth',2,'markersize',14.5);
legend('LOFֵ');
set(legend,'location','best');
end
function x=readFile(fileOrder)
switch fileOrder
    case 0 %macglass
        path=filePath(0);
    case 1%3BF��������
        path=filePath(1);
    case 2%1��������ʹ������
        path=filePath(2);
    case 3%����Һ����Һλ
        path=filePath(3);
    case 4 %�ֲ�����10
        path=filePath(4);
end
data=xlsread(path,'1','b2:b1001');
x=data(1:100);
end
function x=opeData(x,count,fileOrder)
randdata=randperm(size(x,1));%����1�����鳤�ȵ��������
randArray= randdata(1:count);
count=size(randArray,2);
switch fileOrder
    case 0 %macglass
        for i=1:count
            m=randArray(i);
            x(m)=x(m)+0.5;
        end
    case 1%3BF��������
        for i=1:count
            m=randArray(i);
            x(m)=x(m)+1;
        end
    case 2%1��������ʹ������
        for i=1:count
            m=randArray(i);
            x(m)=x(m)+40;
        end
    case 3%����Һ����Һλ
        for i=1:count
            m=randArray(i);
            x(m)=x(m)+10;
        end
    case 4
        for i=1:count
            m=randArray(i);
            x(m)=x(m)+2;
        end
end
end

