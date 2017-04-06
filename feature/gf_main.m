function [] = gf_main(filepath,fileExtOut,varargin)
	% http://blog.csdn.net/flyingworm_eley/article/details/6644970

	if nargin == 0
		filepath = '.';
		fileExtOut = '.fll';
	elseif nargin == 1
		fileExtOut = '.fll';
	else
		% body
	end

	% if length(filepath) == 0
	% 	filepath = '.';
	% elseif length(filepath) ~= 0
	% 	filepath = '.'
	% end

	ext = '*.orx'; 
	files = dir(fullfile(filepath,ext)); 
	for id = 1:length(files)
		pureName = files(id).name;
		fileName = fullfile(filepath,pureName);
		filenameOut = fullfile(filepath,[pureName(1:end-4) fileExtOut]);
		get_features(fileName,filenameOut);
	end

