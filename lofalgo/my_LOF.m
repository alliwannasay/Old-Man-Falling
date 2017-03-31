function lofresult = my_LOF(ma,arglof)

lofresult = [];
%读取原始数据

K=10;
%对数据操作
x=ma;
[m,n]=size(x);
%% 计算各个点之间距离
for i=1:m
    for j=i:m
        dist(i,j)=abs(x(i)-x(j));
        dist(j,i)=dist(i,j);
    end
end

%% 核心部分，对每个点分别计算LOF值
for i=1:m
    %计算k-distance
    [distance,num]=sort(dist(i,:),'ascend');
    kdistance=distance(K+1);
    %集合
    pointArray(i,:)=num(2:K+1);
    %   对集合中每个点计算可达距离
    n=size(pointArray,2);
    for j=1:n
        d(i,j)=distance(j+1);
        [distemp,numtemp]=sort(dist(i,:),'ascend');
        kdistemp=distemp(K+1);
        kdis(j)=kdistemp;
        %可达距离
        reachdis(i,j)=max(d(i,j),kdis(j));
    end
    sum_reachdis=0;
    for j=1:n
        sum_reachdis=sum_reachdis+reachdis(i,j);
    end
    %计算每个点的lrd
    lrd(i)=n/sum_reachdis;
end
%% 得到lof值
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



%%画图
% subplot(2,1,1)
% plot(1:size(x,1),x,'-b.','linewidth',2,'markersize',14.5);
% legend('原始数据');
% title('LOF方法效果图');
% set(legend,'location','best');
% subplot(2,1,2)
% plot(1:size(lof,2),lof,'-r.','linewidth',2,'markersize',14.5);
% legend('LOF值');
% set(legend,'location','best');
end
