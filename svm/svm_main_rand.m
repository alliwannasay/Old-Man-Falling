function [] = svm_main_rand(thisfilename)
% 	if nargin == 0
% 		filepath = './fearesult/';
% 		fileExtOut = '.svm';
% 	elseif nargin == 1
% 		filepath = './fearesult/';
% 	else
% 		body
%     end

    filepath = './fearesult/';
    fileExtOut = '.svm';
    
    prob = 0.15;

    filenames = cell(1,1000);
    trainfilenames = cell(1,1000);
    testfilenames = cell(1,1000);
    trid = 1;
    teid = 1;
	ext = '*.fll'; 
	files = dir(fullfile(filepath,ext)); 
	for id = 1:length(files)
		pureName = files(id).name;
		fileName = fullfile(filepath,pureName);
        filenames{id} = fileName;
        thisprob = rand()
        if thisprob >= 0 && thisprob <= prob
            testfilenames{teid} = fileName;
            teid = teid+1;
        else
            trainfilenames{trid} = fileName;
            trid = trid+1;
        end
    end
    svm_matrix = set_up_svm_ma(filenames);
    filenameOut = fullfile(filepath,[strcat('../',thisfilename,'_all_result') fileExtOut]);
    dlmwrite(filenameOut, svm_matrix, 'delimiter', '\t');
    
    train_svm_matrix = set_up_svm_ma(trainfilenames);
    filenameOut = fullfile(filepath,[strcat('../',thisfilename,'_train_result') fileExtOut]);
    dlmwrite(filenameOut, train_svm_matrix, 'delimiter', '\t');
    
    test_svm_matrix = set_up_svm_ma(testfilenames);
    filenameOut = fullfile(filepath,[strcat('../',thisfilename,'_test_result') fileExtOut]);
    dlmwrite(filenameOut, test_svm_matrix, 'delimiter', '\t');
    
    
    

