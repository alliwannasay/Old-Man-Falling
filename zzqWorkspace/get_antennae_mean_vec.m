function meanResult = get_antennae_mean_vec(ma)
meanVec = [];
[m,n] = size(ma);
for i = 1:n
    col = ma(:,i);
    vec = col';
    vecMean = mean(vec);
    meanVec = [meanVec vecMean];
end
meanResult = meanVec;
    