oriFile = 'walk_zzq_201611241559_20170227T211116';
argButterRate = 0.5;
argstep = 5;
arglof = 25;
argInterval = 100;
argRadius = 100;
lowPassResult = preprepare(oriFile,argButterRate,argstep,arglof,argInterval);
lofresult = get_compressed_stream(abs(lowPassResult),argstep,arglof,argInterval)
[m,n] = size(lofresult);
[am,an] = size(lowPassResult);
totalResult = [];

for i = 1:n
    left = (lofresult(i)-argRadius);
    right = (lofresult(i)+argRadius);
    if lofresult(i) <= argRadius
        left = 1;
        right = argRadius*2+1;
    end
    if lofresult(i) >= am-argRadius
        right = am;
        left = right - argRadius*2;
    end
    
    ma = lowPassResult(left:right,:);
    feaResult = get_features_fly(ma,right-left+1);
    label = svm_fly(feaResult);
    totalResult = [totalResult;lofresult(i),label];
end

display(totalResult);



