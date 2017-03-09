function [result] = get_feature_5(data)
	% FEATURE 5: Signal entropy
	% http://cn.mathworks.com/help/wavelet/ref/wentropy.html
	% http://blog.sina.com.cn/s/blog_6163bdeb0102e1cz.html
	% 'shannon', 'log energy', 'threshold', 'sure', 'norm', 'user'
	result = wentropy(data,'shannon');
	