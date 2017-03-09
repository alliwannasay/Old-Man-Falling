oriFile = 'fall_zzq_201703042121_50hz';
argButterRate = 0.5;
argWinSize = 30;
argAtContainThre = 10;
argStdWeight = 0;
argjudgeInterval = 100;

maResult = divide_data(oriFile,'fall_zzq_201702272219_10ms',argButterRate,argWinSize,argAtContainThre,argStdWeight,argjudgeInterval)

for i = 1:10
    ma = maResult{i};
    [m,n] = size(ma);
    if m ~= 0
        % save_in_dat(ma,oriFile,i,argButterRate,argWinSize,argAtContainThre,argStdWeight)
        
    end
end
