oriFile = 'fall_zzq_201603142212_100hz';
argButterRate = 0.8;
argWinSize = 20;
argAtContainThre = 40;
argStdWeight = 0;
argjudgeInterval = 100;

maResult = divide_data(oriFile,'fall_zzq_201603142212_100hz',argButterRate,argWinSize,argAtContainThre,argStdWeight,argjudgeInterval)

for i = 1:10
    ma = maResult{i};
    [m,n] = size(ma);
    if m ~= 0
        % save_in_dat(ma,oriFile,i,argButterRate,argWinSize,argAtContainThre,argStdWeight)
        
    end
end
