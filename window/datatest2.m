[ma,timeTuple] = csi_get_all ('fall_ysz_201611241646.dat');
rate = 0.5;
% partOfMa = ma(1:100,:)
lowPassResult = butter_low_pass(ma,rate);
mesh(abs(lowPassResult))
% meanResult = get_antennae_mean_vec(lowPassResult);
% stdResult = get_antennae_std_vec(lowPassResult);
% stableThreshold = get_threshold_vec_of_stable_static();
% [startVec,winSize] = get_fall_like_win(lowPassResult,10,stableThreshold)