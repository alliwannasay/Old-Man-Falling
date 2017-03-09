n=0:0.1:2;
for i=1:4
switch i
    case 1 ,N=2;  %频率点
    case 2 ,N=5;  %取4种滤波器
    case 3,N=10;
    case 4,N=20;
end
[z,p,k] = buttap ( N );        %设计butterworth滤波器
[b,a] = zp2tf(z,p,k);          %将零点、极点、增益的形式转换为传递函数
[H,w] =freqs(b,a,n);          %按n制定的频率点给出频率响应
disp(n)
magH2 = (abs(H)).^2;       %给出传递函数幅度平方
hold on;
plot (w, magH2);                
end
xlabel ('w/wc');
ylabel('|H(jw)|^2');
title('Butterworth');
text(1.5,0.18,'n=2');
text(1.3,0.08,'n=10');
text(1.16,0.08,'n=10');
text(0.93,0.98,'n=20');
grid on;