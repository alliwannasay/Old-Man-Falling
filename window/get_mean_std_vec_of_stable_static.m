function [stableMeanResult,stableStdResult] = get_mean_std_vec_of_stable_static(lowPassResult,rate)
% [ma,timeTuple] = csi_get_all ('walk_zzq_201611241559.dat');

stableMeanResult = get_antennae_mean_vec(lowPassResult);
stableStdResult = get_antennae_std_vec(lowPassResult);
