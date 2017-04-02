function [] = draw_picture_antenna_tmp(ma)
toShow = mean(ma,2)
[m,n] = size(ma);
inter = 1:1:m
% toShow = toShow(inter);
power = 30;

sg1 = my_polyfit(power,inter,toShow','r');
set(sg1,'handlevisibility','off');
legend('fall down','sit down');
grid on;


