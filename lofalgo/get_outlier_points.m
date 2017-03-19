function outlierPs = get_outlier_points(lofresult,argInterval)
outlierPs = [];
prep = lofresult(1);
curp = lofresult(1);
[m,n] = size(lofresult);
outlierPs = [outlierPs curp];
for i = 2:n
    curp = lofresult(i);
    if curp - prep > argInterval
        outlierPs = [outlierPs curp];
    end
    prep = curp;
end