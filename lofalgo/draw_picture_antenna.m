function [] = draw_picture_antenna(ma)
toShow = mean(ma,2)
[m,n] = size(ma);
inter = 1:1:m
% toShow = toShow(inter);
power = 30;

power = 30;


sg1 = my_polyfit(power,inter,toShow','b');
set(sg1,'handlevisibility','off');
legend('fall down','sit down');
grid on;


