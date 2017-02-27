function [stableMeanResult,stableStdResult] = get_mean_std_vec_of_stable_static()
[ma,timeTuple] = csi_get_all ('walk_zzq_201611241559.dat');
rate = 0.5;
lowPassResult = butter_low_pass(ma,rate);
stableMeanResult = get_antennae_mean_vec(lowPassResult);
stableStdResult = get_antennae_std_vec(lowPassResult);
