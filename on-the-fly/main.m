function [] = gf_main(filepath,fileExtOut,varargin)
    % http://blog.csdn.net/flyingworm_eley/article/details/6644970

    if nargin == 0
        filepath = '.';
        fileExtOut = '.wtf';
    elseif nargin == 1
        fileExtOut = '.wtf';
    else
        % body
    end

    % if length(filepath) == 0
    %   filepath = '.';
    % elseif length(filepath) ~= 0
    %   filepath = '.'
    % end

    ext = '*.dat'; 
    lastNumOfFile = 0;
    curNumOfFile = 0;

    while(1)
        files = dir(fullfile(filepath,ext)); 
        curNumOfFile = size(files);
        if lastNumOfFile < curNumOfFile
            id = curNumOfFile - 1;
            pureName = files(id).name;
            treat_single_file(pureName(1:end-4));
            lastNumOfFile = curNumOfFile;
        end
    end
