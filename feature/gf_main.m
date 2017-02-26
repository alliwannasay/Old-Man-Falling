function [] = gf_main(filepath,filenameOut,varargin)
	% http://blog.csdn.net/flyingworm_eley/article/details/6644970

	if nargin == 0
		filepath = '.';
		filenameOut = 'fuck.all';
	elseif nargin == 1
		filepath = '.';
	else
		body
	end

	% if length(filepath) == 0
	% 	filepath = '.';
	% elseif length(filepath) ~= 0
	% 	filepath = '.'
	% end

	ext = '*.orx'; 
	files = dir(fullfile(filepath,ext)); 
	for id = 1:length(files)
		fileName = fullfile(filepath,files(id).name);
		get_features(fileName,filenameOut);
	end

