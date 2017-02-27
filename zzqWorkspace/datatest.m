oriFile = 'fall_zzq_201611241636';
oriFilename = strcat(oriFile,'.dat');
[ma,timeTuple] = csi_get_all (oriFilename);
size(ma)
rate = 0.5;

lowPassResult = butter_low_pass(ma,rate);

argEngAntNum = 50;
argEngWinSize = 10;
argStdWeight = 0.1;
engPtVec = set_ending_points(lowPassResult,argEngAntNum,argEngWinSize,argStdWeight)

% argButterRate = 0.5;
% argWinSize = 10;
% argAtContainThre = 25;
% argStdWeight = 0.2;
% startVec = get_fall_like_win(lowPassResult,argWinSize,argAtContainThre,argStdWeight)



