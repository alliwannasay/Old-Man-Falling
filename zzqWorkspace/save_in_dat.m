function save_in_dat(ma,oriFile,startPoint,argButterRate,argWinSize,argAtContainThre,argStdWeight,label)
head = [startPoint,argButterRate,argWinSize,argAtContainThre,argStdWeight,label];
outFilename = strcat('res_',oriFile)
outFilename = strcat(outFilename,'_');
outFilename = strcat(outFilename,int2str(startPoint));
outFilename = strcat(outFilename,'.txt');
dlmwrite(outFilename, head);
saveMa = ma(startPoint:startPoint+argWinSize,:);
dlmwrite(outFilename, saveMa, '-append','delimiter', '\t');

