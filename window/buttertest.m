n=0:0.1:2;
for i=1:4
switch i
    case 1 ,N=2;  %Ƶ�ʵ�
    case 2 ,N=5;  %ȡ4���˲���
    case 3,N=10;
    case 4,N=20;
end
[z,p,k] = buttap ( N );        %���butterworth�˲���
[b,a] = zp2tf(z,p,k);          %����㡢���㡢�������ʽת��Ϊ���ݺ���
[H,w] =freqs(b,a,n);          %��n�ƶ���Ƶ�ʵ����Ƶ����Ӧ
disp(n)
magH2 = (abs(H)).^2;       %�������ݺ�������ƽ��
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