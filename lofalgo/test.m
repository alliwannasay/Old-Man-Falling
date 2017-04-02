hold on
oriFile = 'fall_zzq_20170322_100hz_situ1';
argButterRate = 0.5;
argstep = 10;
arglof = 18;
argInterval = 100;
argRadius = 100;

lowPassResult = preprepare(oriFile,argButterRate,argstep,arglof,argInterval);
% figure('NumberTitle', 'off', 'Name', oriFile);
% mesh(abs(lowPassResult));
draw_picture_antenna(abs(lowPassResult(5100:5100+1380,31:60)));

oriFile = 'sit_zzq_20170319_100hz_situ1';
argButterRate = 0.5;
argstep = 10;
arglof = 18;
argInterval = 100;
argRadius = 100;


lowPassResult = preprepare(oriFile,argButterRate,argstep,arglof,argInterval);
draw_picture_antenna_tmp(abs(lowPassResult(1500:1500+1380,31:60)));

hold off
