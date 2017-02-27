function [] = ad_main(filepath,fileExtOut,varargin)
	% http://blog.csdn.net/flyingworm_eley/article/details/6644970
	% http://www.cnblogs.com/emanlee/archive/2011/12/19/2293234.html

	if nargin == 0
		filepath = '.';
		fileExtOut = '.orz';
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

	ext = '*.dat'; 
	files = dir(fullfile(filepath,ext)); 
	for id = 1:length(files)
		pureName = files(id).name;
		fileName = fullfile(filepath,pureName);
		filenameOut = fullfile(filepath,[pureName(1:end-4) '_' datestr(now,30) fileExtOut]);
		add_noise(fileName,filenameOut);
	end
