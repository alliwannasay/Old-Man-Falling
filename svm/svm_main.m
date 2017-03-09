function [] = svm_main(filepath,fileExtOut,varargin)
	% http://blog.csdn.net/flyingworm_eley/article/details/6644970

	if nargin == 0
		filepath = '.';
		fileExtOut = '.svm';
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
    filenames = cell(1,100);
	ext = '*.fll'; 
	files = dir(fullfile(filepath,ext)); 
	for id = 1:length(files)
		pureName = files(id).name;
		fileName = fullfile(filepath,pureName);
        filenames{id} = fileName;
		% filenameOut = fullfile(filepath,[pureName(1:end-4) fileExtOut]);
		% get_features(fileName,filenameOut);
    end
    svm_matrix = set_up_svm_ma(filenames);
    filenameOut = fullfile(filepath,['../test_result' fileExtOut]);
    dlmwrite(filenameOut, svm_matrix, 'delimiter', '\t');
    
    
    

