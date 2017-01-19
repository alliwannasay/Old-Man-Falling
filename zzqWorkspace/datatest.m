[ma,timeTuple] = csi_get_all ('stand_zzq_201611241603.dat');
rate = 0.5;
% partOfMa = ma(1:100,:)
lowPassResult = butter_low_pass(ma,rate);
% mesh(abs(lowPassResult))
meanResult = get_antennae_mean_vec(lowPassResult);
stdResult = get_antennae_std_vec(lowPassResult);
col = lowPassResult(:,1);
vec = col';
plot(abs(vec))
[startVec,winSize] = get_fall_like_win_for_one_antennae(vec,10,1)