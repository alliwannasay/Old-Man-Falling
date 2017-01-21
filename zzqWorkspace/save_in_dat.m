function save_in_dat(ma,oriFile,startPoint,argButterRate,argWinSize,argAtContainThre,argStdWeight,label)
head = [startPoint,argButterRate,argWinSize,argAtContainThre,argStdWeight,label];
dlmwrite('pureTest.txt', head);
saveMa = ma(startPoint:startPoint+argWinSize,:);
dlmwrite('pureTest.txt', saveMa, '-append','delimiter', '\t');

