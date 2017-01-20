function stableThreshold = get_threshold_vec_of_stable_static(stdWeight)
[stableMeanResult,stableStdResult] = get_mean_std_vec_of_stable_static;
stableThreshold = stableMeanResult + stdWeight*stableStdResult;
