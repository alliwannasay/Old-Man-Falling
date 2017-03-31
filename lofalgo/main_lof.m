oriFile = 'fall_zzq_201603142212_100hz';
argButterRate = 0.5;
argstep = 10;
arglof = 18;
argInterval = 100;
argRadius = 100;


lowPassResult = preprepare(oriFile,argButterRate,argstep,arglof,argInterval);
% mesh(abs(lowPassResult));

lofresult = get_compressed_stream(abs(lowPassResult),argstep,arglof,argInterval);
[m,n] = size(lofresult);
[am,an] = size(lowPassResult);
rectlist = [];

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
    newrect = [left right];
    rectlist = [rectlist;newrect];
    ma = lowPassResult(left:right,:);
    % save_in_dat_lof(ma,lofresult(i),oriFile,i,argButterRate,argWinSize,argAtContainThre,argStdWeight)
end
draw_picture_with_rect(abs(lowPassResult),rectlist);


