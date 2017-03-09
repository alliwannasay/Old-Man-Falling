function save_in_dat(ma,oriFile,id,argButterRate,argWinSize,argAtContainThre,argStdWeight)
label = 0;
% if rem(id,2) == 1
%     label = 1;
% end
head = [argButterRate,argWinSize,argAtContainThre,argStdWeight,label];
outFilename = strcat('',int2str(label));
outFilename = strcat(outFilename,'_res_');
outFilename = strcat(outFilename,oriFile);
outFilename = strcat(outFilename,'_');
outFilename = strcat(outFilename,int2str(id));
outFilename = strcat(outFilename,'.orx');
dlmwrite(outFilename, head);
saveMa = ma;
dlmwrite(outFilename, saveMa, '-append','delimiter', '\t');

