function f = get_features_matrix(data)
	
	[m,n] = size(data);
	% diff, gradient
	% diffed = diff(data',1)';
	diffed = diff(data,1);
	original = data(1:(m-1),:);
	divided = diffed./original;

	f = [];

	temp = 1:90;
	for id = temp(rem(temp,7)==0)
		col = data(:,id);

		f0 = get_feature_0(col);
		f1 = get_feature_1(col);
		f2 = get_feature_2(m);
		% f3 = get_feature_3(col);
		f4 = get_feature_4(col);
		f5 = get_feature_5(col);
		f6 = get_feature_6(divided(:,id));
		% f7 = get_feature_7(col);
		% f8 = get_feature_8(col);
		% f9 = get_feature_9(col);
        features = [f0 f1 f2 f4 f5 f6];
		f = [f f0 f1 f2 f4 f5 f6];
	end

