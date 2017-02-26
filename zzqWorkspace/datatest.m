oriFile = 'stand_ysz_201611241606';
oriFilename = strcat(oriFile,'.dat');
[ma,timeTuple] = csi_get_all (oriFilename);
size(ma)
rate = 0.5;
% partOfMa = ma(1:100,:)
lowPassResult = butter_low_pass(ma,rate);
% mesh(abs(lowPassResult))
% meanResult = get_antennae_mean_vec(lowPassResult);
% stdResult = get_antennae_std_vec(lowPassResult);
argButterRate = 0.5;
argWinSize = 10;
argAtContainThre = 25;
argStdWeight = 0.2;
startVec = get_fall_like_win(lowPassResult,argWinSize,argAtContainThre,argStdWeight)

% save_in_dat(lowPassResult,oriFile,24,argButterRate,argWinSize,argAtContainThre,argStdWeight,1);
% aRead = dlmread('pureTest.txt');


