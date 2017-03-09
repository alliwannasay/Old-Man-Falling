train_matrix = dlmread('train_result.svm','\t');
test_matrix = dlmread('test_result.svm','\t');
train_matrix = abs(train_matrix);
test_matrix = abs(test_matrix);

[trainm,trainn] = size(train_matrix)
[testm,testn] = size(test_matrix)
train_fea = train_matrix(:,2:trainn);
train_label = train_matrix(:,1);
test_fea = test_matrix(:,2:testn);
test_label = test_matrix(:,1);

svmStruct = svmtrain(train_fea,train_label,'kernel_function','mlp');
C = svmclassify(svmStruct,test_fea);
compare = [C test_label]
err_rate = sum(test_label~= C)/testm; % mis-classification rate
disp(err_rate);
