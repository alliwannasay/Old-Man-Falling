function outlierPos = get_outlier_classified(lofresult,argInterval)
lofresult = sortrows(lofresult,1)
[m,n] = size(lofresult);
itrendp = 1;
divideline = [];
while itrendp < m
    itrendp = itrendp+1;
    if lofresult(itrendp,1) - lofresult(itrendp-1,1) >= argInterval;
        divideline = [divideline itrendp-1];
    end
end
divideline
[md,nd] = size(divideline);
outlierPos = [];
for i = 1:nd
    if i == 1
        newlof = lofresult(1:divideline(i),:);
    else
        newlof = lofresult(divideline(i-1)+1:divideline(i),:);
    end
    newlof = flipud(sortrows(newlof,2));
    outlierPos = [outlierPos newlof(1,1)];
end
newlof = lofresult(divideline(nd)+1:m,:);
newlof = flipud(sortrows(newlof,2));
outlierPos = [outlierPos newlof(1,1)];


