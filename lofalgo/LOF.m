function LOF
clc
clear
fileOrder=1;
%读取原始数据
x=readFile(fileOrder);
K=10;
%对数据操作
count=1;%outlier点个数
x=opeData(x,count,fileOrder);
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
end
%%画图
subplot(2,1,1)
plot(1:size(x,1),x,'-b.','linewidth',2,'markersize',14.5);
legend('原始数据');
title('LOF方法效果图');
set(legend,'location','best');
subplot(2,1,2)
plot(1:size(lof,2),lof,'-r.','linewidth',2,'markersize',14.5);
legend('LOF值');
set(legend,'location','best');
end
function x=readFile(fileOrder)
switch fileOrder
    case 0 %macglass
        path=filePath(0);
    case 1%3BF富氧流量
        path=filePath(1);
    case 2%1炼钢氧气使用流量
        path=filePath(2);
    case 3%宝普液氧罐液位
        path=filePath(3);
    case 4 %局部数据10
        path=filePath(4);
end
data=xlsread(path,'1','b2:b1001');
x=data(1:100);
end
function x=opeData(x,count,fileOrder)
randdata=randperm(size(x,1));%生成1到数组长度的随机排列
randArray= randdata(1:count);
count=size(randArray,2);
switch fileOrder
    case 0 %macglass
        for i=1:count
            m=randArray(i);
            x(m)=x(m)+0.5;
        end
    case 1%3BF富氧流量
        for i=1:count
            m=randArray(i);
            x(m)=x(m)+1;
        end
    case 2%1炼钢氧气使用流量
        for i=1:count
            m=randArray(i);
            x(m)=x(m)+40;
        end
    case 3%宝普液氧罐液位
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

