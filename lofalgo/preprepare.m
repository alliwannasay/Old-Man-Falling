function lowPassResult = preprepare(oriFile,argButterRate,argstep,arglof,argInterval)
oriFilename = strcat(oriFile,'.dat');
[ma,timeTuple] = csi_get_all (oriFilename);
% mesh(abs(ma));
wholema = ma(:,:);
size(ma);

lowPassResult = butter_low_pass(wholema,argButterRate);






