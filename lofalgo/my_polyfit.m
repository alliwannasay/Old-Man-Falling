function sg = my_polyfit(power,inter,toShow,color)
c = polyfit(inter, toShow, power);  %������ϣ�cΪ2����Ϻ��ϵ��
d = polyval(c, inter, 1);  %��Ϻ�ÿһ���������Ӧ��ֵ��Ϊd
plot(inter, d, color,'LineWidth',3);       %��Ϻ������
[m,n] = size(d)
newinter = 1:50:n;
newd = d(newinter);
sg = scatter(newinter,newd,'k','LineWidth',5)
% plot(inter, d, '*');       %��ÿ���� ��*������