function [result] = get_feature_4(data)
	% FEATURE 4: Interquartile range (IR)
	% http://cn.mathworks.com/help/stats/iqr.html
	result = iqr(data);
	