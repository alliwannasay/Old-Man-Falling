function [] = draw_p(filenameIn)
	% [cfr_array, timestamp] = csi_get_all(filename);
	[data,argButterRate,argWinSize,argAtContainThre,argStdWeight,label] = pretreat(filenameIn);

	[m,n] = size(data);
	% diff, gradient
	% diffed = diff(data',1)';
	diffed = diff(data,1);
	original = data(1:(m-1),:);
	divided = diffed./original;

	f = [];

	temp = 1:90;
	for id = temp(rem(temp,47)==0)
		col = data(:,id);

		f0 = get_feature_0(col);
		f1 = get_feature_1(col);
		f2 = get_feature_2(argWinSize);
		f3 = get_feature_3(col);
		f4 = get_feature_4(col);
		f5 = get_feature_5(col);
		f6 = get_feature_6(divided(:,id));
		% f7 = get_feature_7(col);
		% f8 = get_feature_8(col);
		% f9 = get_feature_9(col);

		% f = [f f0 f1 f2 f4 f5 f6];
		plot(col,f0,col,f1,col,f2,col,f3,col,f4,col,f5,col,f6)
	end

	% posttreat(filenameOut,label,f);
