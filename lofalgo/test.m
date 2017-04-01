oriFile = 'sit_zzq_20170320_100hz_situ1';
argButterRate = 0.5;
argstep = 10;
arglof = 18;
argInterval = 100;
argRadius = 100;


lowPassResult = preprepare(oriFile,argButterRate,argstep,arglof,argInterval);
figure('NumberTitle', 'off', 'Name', oriFile);
mesh(abs(lowPassResult));