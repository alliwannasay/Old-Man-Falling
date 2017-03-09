function engPtVec = get_ending_points(ma,engWinSize,endAntNum,stdWeight,basicMa,lowPassRate)
stableThreshold = get_threshold_vec_of_stable_static(stdWeight,basicMa,lowPassRate);
[m,n] = size(ma);
engPtVec = [];
isTaking = 0;
for i = 1:(m-engWinSize)
    winMa = ma(i:i+engWinSize,:);
    isTaking = 0;
    for j = 1:n
        thisThreshold = stableThreshold(1,j);
        winAt = winMa(:,j);
        if mean(winAt') >= thisThreshold
            isTaking = isTaking + 1;
        end
    end
    if isTaking >= endAntNum
        engPtVec = [engPtVec i+engWinSize];
    end
end


