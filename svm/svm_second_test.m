function returnResult = svm_second_test(outfile,testfile)
train_matrix = dlmread(strcat(outfile,'_train_result.svm'),'\t');
test_matrix = dlmread(strcat(outfile,'_',testfile),'\t');
train_matrix = abs(train_matrix);
test_matrix = abs(test_matrix);

[trainm,trainn] = size(train_matrix);
[testm,testn] = size(test_matrix);
dlmwrite(outfile, '******************************','-append','delimiter', '');
dlmwrite(outfile, testfile,'-append','delimiter', '');
dlmwrite(outfile, strcat('trainm: ',int2str(trainm)),'-append','delimiter', '');
% dlmwrite('this_result.txt', trainm,'-append','delimiter', '');
dlmwrite(outfile, strcat('testm: ',int2str(testm)),'-append','delimiter', '');
% dlmwrite('this_result.txt', testm,'-append','delimiter', '');

train_fea = train_matrix(:,2:trainn);
train_label = train_matrix(:,1);
test_fea = test_matrix(:,2:testn);
test_label = test_matrix(:,1);

kerlist = cell(1,5);
kerlist{1} = 'linear';
kerlist{2} = 'quadratic';
kerlist{3} = 'mlp';
kerlist{4} = 'rbf';
kerlist{5} = 'polynomial';

returnResult = [0,0,0,0,0;0,0,0,0,0;0,0,0,0,0];
for id = 1:length(kerlist)
    err_rate = NaN;
    mdr = NaN;
    fdr = NaN;
    try
        svmStruct = svmtrain(train_fea,train_label,'kernel_function',kerlist{id});
        C = svmclassify(svmStruct,test_fea);
        compare = [C test_label];
        err_rate = sum(test_label~= C)/testm;
        if err_rate <= 0.2 && strcmp(testfile,'test_result.svm')
            dlmwrite('menu.txt',strcat(outfile,';',kerlist{id},';',num2str(err_rate)),'-append','delimiter', '');
        end
        [mdr,fdr] = svm_mfdr(C,test_label);
        dlmwrite(outfile, strcat(kerlist{id},': ', num2str(err_rate),' mdr: ',num2str(mdr),' fdr:',num2str(fdr)),'-append','delimiter', '');
        
    end
    returnResult(1,id) = err_rate;
    returnResult(2,id) = mdr;
    returnResult(3,id) = fdr;
end