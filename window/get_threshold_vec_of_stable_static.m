function stableThreshold = get_threshold_vec_of_stable_static(stdWeight,basicMa,rate)
[stableMeanResult,stableStdResult] = get_mean_std_vec_of_stable_static(basicMa,rate);
stableThreshold = stableMeanResult + stdWeight*stableStdResult;
