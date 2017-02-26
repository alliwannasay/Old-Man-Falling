function [result] = get_feature_0(data)
	% FEATURE 0: Normalized standard deviation (STD) of CSI
	% http://www.ilovematlab.cn/thread-27021-1-1.html
	% or http://www.ilovematlab.cn/forum.php?mod=viewthread&tid=74021
	% premnmx, postmnmx, tramnmx, prestd, poststd, trastd
	nom = mapminmax(data);
	result = std(nom);
