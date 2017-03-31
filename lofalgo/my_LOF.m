function lofresult = my_LOF(ma,arglof)

lofresult = [];
%��ȡԭʼ����

K=10;
%�����ݲ���
x=ma;
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
    if lof(i) >= arglof
        newRow = [i,lof(i)];
        lofresult = [lofresult;newRow];
    end
end



%%��ͼ
% subplot(2,1,1)
% plot(1:size(x,1),x,'-b.','linewidth',2,'markersize',14.5);
% legend('ԭʼ����');
% title('LOF����Ч��ͼ');
% set(legend,'location','best');
% subplot(2,1,2)
% plot(1:size(lof,2),lof,'-r.','linewidth',2,'markersize',14.5);
% legend('LOFֵ');
% set(legend,'location','best');
end
