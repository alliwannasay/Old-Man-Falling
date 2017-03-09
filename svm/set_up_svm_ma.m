function svm_matrix = set_up_svm_ma(filenames)
svm_matrix = [];
for id = 1:length(filenames)
    filename = filenames{id};
    [m,n] = size(filename);
    if m ~= 0
        data = dlmread(filename,'\t');
        svm_matrix = [svm_matrix;data];
    end
end
