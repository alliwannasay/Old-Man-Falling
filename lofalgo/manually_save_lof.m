oriFile = 'fall_zzq_20170328_100hz_situ1_2';
argButterRate = 0.5;
argstep = 5;
arglof = 25;
argInterval = 100;
argRadius = 100;


lowPassResult = preprepare(oriFile,argButterRate,argstep,arglof,argInterval);

lofresultyes = [2005,3115,6150];
lofresultno = [2485,4245,5385,7150];

[m,n] = size(lofresultyes);
[am,an] = size(lowPassResult);
rectlist = [];

for i = 1:n
    left = (lofresultyes(i)-argRadius);
    right = (lofresultyes(i)+argRadius);
    if lofresultyes(i) <= argRadius
        left = 1;
        right = argRadius*2+1;
    end
    if lofresultyes(i) >= am-argRadius
        right = am;
        left = right - argRadius*2;
    end
    ma = lowPassResult(left:right,:);
    save_in_dat_lof_fall(ma,lofresultyes(i),oriFile,i,argButterRate,argstep,arglof,argInterval,1)
end

[m,n] = size(lofresultno);
for i = 1:n
    left = (lofresultno(i)-argRadius);
    right = (lofresultno(i)+argRadius);
    if lofresultno(i) <= argRadius
        left = 1;
        right = argRadius*2+1;
    end
    if lofresultno(i) >= am-argRadius
        right = am;
        left = right - argRadius*2;
    end
    ma = lowPassResult(left:right,:);
    save_in_dat_lof_fall(ma,lofresultno(i),oriFile,i,argButterRate,argstep,arglof,argInterval,0)
end

