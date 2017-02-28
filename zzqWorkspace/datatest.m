oriFile = 'fall_zzq_201702272219_10ms';
oriFilename = strcat(oriFile,'.dat');
[ma,timeTuple] = csi_get_all (oriFilename);
wholema = ma(:,31:60);
size(ma)
argButterRate = 0.5;

lieStable = ma(2000:4000,31:60);

lowPassResult = butter_low_pass(wholema,argButterRate);
lowPassStable = butter_low_pass(lieStable,argButterRate);

mesh(abs(lowPassResult))
% mesh(abs(lowPassStable))

% ma_0 = lowPassResult(:,45)
% mesh(abs(lowPassResult));

% argEngAntNum = 45;
% argEngWinSize = 10;
% argStdWeight = 0.09;
% 
% engPtVec = get_ending_points(lowPassResult,argEngAntNum,argEngWinSize,argStdWeight,lieStable,argButterRate);

argWinSize = 30;
argAtContainThre = 10;
argStdWeight = 0;
startVec = get_ending_points(abs(lowPassResult),argWinSize,argAtContainThre,argStdWeight,abs(lieStable),argButterRate)
winResult = get_fall_like_win_real(startVec,100)


