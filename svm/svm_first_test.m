% Load the data and select features for classification
load fisheriris
X = [meas(:,1), meas(:,2)];
plot(meas(:,1), meas(:,2),'*');
% Extract the Setosa class
Y = nominal(ismember(species,'setosa'));
% Randomly partitions observations into a training set and a test
% set using stratified holdout
P = cvpartition(Y,'Holdout',0.20);
% Use a linear support vector machine classifier
X(P.training,:)
Y(P.training)
svmStruct = svmtrain(X(P.training,:),Y(P.training),'showplot',true)
dlmread('svm_test.txt',svmStruct);
C = svmclassify(svmStruct,X(P.test,:),'showplot',true);
err_rate = sum(Y(P.test)~= C)/P.TestSize; % mis-classification rate
disp(err_rate);
conMat = confusionmat(Y(P.test),C); % the confusion matrix