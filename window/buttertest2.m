Fs=1000; %Sampling Frequency
time = 0:(1/Fs):1; %time vector
x = cos(2*pi*60*time)+sin(2*pi*120*time)+randn(size(time));
plot(time,x)
Wn = 0.5; %Convert 3-dB frequency
% to normalized frequency: 0.4*pi rad/sample
[B,A] = butter(5,Wn,'low');
y = filter(B,A,x);
hold on
plot(time,y)
hold off
