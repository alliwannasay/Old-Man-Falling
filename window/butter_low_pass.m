function lowPassResult = butter_low_pass(ma,rate)
lowPassResult = [];
[m,n] = size(ma);
for i = 1:n
   col = ma(:,i);
   vec = col';
   Wn = 0.5; %Convert 3-dB frequency
    % to normalized frequency: 0.4*pi rad/sample
   [B,A] = butter(5,Wn,'low');
   y = filter(B,A,vec);
   lowPassResult = [lowPassResult y'];
end
