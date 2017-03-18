function maResult = divide_data(oriFile,stbFile,argButterRate,argWinSize,argAtContainThre,argStdWeight,argjudgeInterval)
% oriFile = 'fall_zzq_201702272219_10ms';
oriFilename = strcat(oriFile,'.dat');
% stbFile = 'fall_zzq_201702272219_10ms';
stbFilename = strcat(stbFile,'.dat');
[stdma,timeTuple] = csi_get_all (stbFilename);
[ma,timeTuple] = csi_get_all (oriFilename);
wholema = ma(:,:);
size(ma);


lieStable = stdma(:,:);

lowPassResult = butter_low_pass(wholema,argButterRate);
lieStable = butter_low_pass(lieStable,argButterRate);
% lowPassStable = butter_low_pass(lieStable,argButterRate);

% plot(angma(:,1))
% mesh(abs(lowPassResult))
get_compressed_stream(abs(lowPassResult))

% lowPassResult = smoother(lowPassResult,3);
% lieStable = smoother(lieStable,3);
% mesh(abs(lowPassResult(:,1:60)))

maResult = [];
% живЊ
% startVec = get_ending_points(abs(lowPassResult),argWinSize,argAtContainThre,argStdWeight,abs(lieStable),argButterRate);
% winResult = get_fall_like_win_real(abs(lowPassResult),startVec,argjudgeInterval)
% maResult = get_fall_like_ma(lowPassResult,winResult);


