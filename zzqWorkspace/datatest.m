[ma,timeTuple] = csi_get_all ('fall_zzq_201611241630.dat');
size(ma)
rate = 0.5;
% partOfMa = ma(1:100,:)
lowPassResult = butter_low_pass(ma,rate);
% mesh(abs(lowPassResult))
% meanResult = get_antennae_mean_vec(lowPassResult);
% stdResult = get_antennae_std_vec(lowPassResult);
[startVec,winSize] = get_fall_like_win(lowPassResult,stableThreshold,10,23,0.2)