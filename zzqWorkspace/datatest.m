[fucka,fuckt] = csi_get_all ('walk_ysz_201611241553.dat')
mat = angle(fucka)
firstMat = mat(:,1:90)
plot(firstMat(1:30))
After = []
for i = 1:30
    submat = firstMat(:,i)
    subvec = submat'
    Wn = 0.5; %Convert 3-dB frequency
    % to normalized frequency: 0.4*pi rad/sample
    [B,A] = butter(5,Wn,'low');
    y = filter(B,A,subvec);
    After = [After y']
end

