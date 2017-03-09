oriFile = 'fall_zzq_201702272219_10ms';
oriFilename = strcat(oriFile,'.dat');
[ma,timeTuple] = csi_get_all (oriFilename);
wholema = ma(:,:);
size(ma)
argButterRate = 0.5;

lieStable = ma(2000:4000,31:60);

lowPassResult = butter_low_pass(wholema,argButterRate);
lowPassStable = butter_low_pass(lieStable,argButterRate);

mesh(abs(lowPassResult))

