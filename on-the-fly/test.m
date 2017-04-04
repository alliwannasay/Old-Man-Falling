oriFile = 'fall_zzq_20170322_100hz_situ1';
argButterRate = 0.5;
argstep = 10;
arglof = 10;
argInterval = 100;
argRadius = 100;
lowPassResult = preprepare(oriFile,argButterRate,argstep,arglof,argInterval);
mesh(abs(lowPassResult));