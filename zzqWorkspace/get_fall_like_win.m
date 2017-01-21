function startVec = get_fall_like_win(ma,winSize,atContainThre,stdWeight)
stableThreshold = get_threshold_vec_of_stable_static(stdWeight);
[m,n] = size(ma);
startVec = [];
isTaking = 0;
for i = 1:(m-winSize)
    winMa = ma(i:i+winSize,:);
    isTaking = 0;
    for j = 1:n
        thisThreshold = stableThreshold(1,j)
        winAt = winMa(:,j);
        if mean(winAt') > thisThreshold
            isTaking = isTaking + 1;
        end
    end
    if isTaking >= atContainThre
        startVec = [startVec i];
    end
end
    
    