function sg = my_polyfit(power,inter,toShow,color)
c = polyfit(inter, toShow, power);  %进行拟合，c为2次拟合后的系数
d = polyval(c, inter, 1);  %拟合后，每一个横坐标对应的值即为d
plot(inter, d, color,'LineWidth',3);       %拟合后的曲线
[m,n] = size(d)
newinter = 1:50:n;
newd = d(newinter);
sg = scatter(newinter,newd,'k','LineWidth',5)
% plot(inter, d, '*');       %将每个点 用*画出来