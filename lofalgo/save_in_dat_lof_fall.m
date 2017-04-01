function save_in_dat_lof(ma,center,oriFile,id,argButterRate,argstep,arglof,argInterval,label)

head = [argButterRate,argstep,arglof,argInterval,label];
outFilename = strcat('',int2str(label));
outFilename = strcat(outFilename,'_res_');
outFilename = strcat(outFilename,oriFile);
outFilename = strcat(outFilename,'_id_');
outFilename = strcat(outFilename,int2str(id));
outFilename = strcat(outFilename,'_center_');
outFilename = strcat(outFilename,int2str(center));
outFilename = strcat(outFilename,'.orx');
dlmwrite(outFilename, head);
saveMa = ma;
dlmwrite(outFilename, saveMa, '-append','delimiter', '\t');