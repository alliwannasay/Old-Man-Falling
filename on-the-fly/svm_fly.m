function label = svm_fly(feaResult)
    train_matrix = dlmread('5result_train_result_fly.svm');
    train_matrix = abs(train_matrix);
    [trainm,trainn] = size(train_matrix);
    train_fea = train_matrix(:,2:trainn);
    train_label = train_matrix(:,1);
    
    test_fea = feaResult;
    svmStruct = svmtrain(train_fea,train_label,'kernel_function','linear');
    label = svmclassify(svmStruct,abs(test_fea));
%     C = 0;
%     try
%         svmStruct = svmtrain(train_fea,train_label,'kernel_function','linear');
%         C = svmclassify(svmStruct,test_fea)
%     end
%     label = C