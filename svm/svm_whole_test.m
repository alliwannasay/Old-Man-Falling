len = 100;
start = 1;
svmResult = [0,0,0,0,0;0,0,0,0,0;0,0,0,0,0];
sumlen = 0;
goodlist = [];
for i = start:start+len-1
    thisfilename = strcat(int2str(i),'result');
    svm_main_rand(thisfilename);
    
    returnResult = svm_second_test(thisfilename,'test_result.svm');
    if isnan(returnResult(1,5))
        continue;
    end
    
    if returnResult(1,1) <= 0.2
        goodlist = [goodlist i];
        svmResult = svmResult + returnResult;
        sumlen = sumlen+1;
    end
    
    svm_second_test(thisfilename,'train_result.svm');
    svm_second_test(thisfilename,'all_result.svm');
    
    if sumlen == 50
        break
    end
end

sumlen
svmResult = svmResult / sumlen
dlmwrite('menu.txt','sumlen','-append','delimiter', '');
dlmwrite('menu.txt',sumlen,'-append','delimiter', '\t');
dlmwrite('menu.txt','goodlist','-append','delimiter', '');
dlmwrite('menu.txt',goodlist,'-append','delimiter', '\t');
dlmwrite('menu.txt','svmResult','-append','delimiter', '');
dlmwrite('menu.txt',svmResult,'-append','delimiter', '\t');



