function [startVec,winSize] = get_fall_like_win_for_one_antennae(vec,winSize,threshold)
vecMean = mean(vec);
vecStd = std(vec);
[m,t] = size(vec);
startVec = []
for i = 1:(t-winSize)
    winVec = vec(:,i:i+winSize);
    if mean(winVec) > threshold
        startVec = [startVec i];
    end
end
