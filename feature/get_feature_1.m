function [result] = get_feature_1(data)
	% FEATURE 1: Medianabsolute deviation (MAD)
	% http://cn.mathworks.com/help/stats/mad.html
	result = mad(data);
	