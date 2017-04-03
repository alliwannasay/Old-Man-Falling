function [mdr,fdr] = svm_mfdr(C,test_label)
mdr = 0;
fdr = 0;
sum_mdr = 0;
sum_fdr = 0;
over_mdr = 0;
over_fdr = 0;
[m,n] = size(C);
for i = 1:m
    if test_label(i) == 1
        sum_mdr = sum_mdr + 1;
    end
    if C(i) == 1
        sum_fdr = sum_fdr + 1;
    end
    if test_label(i) == 1 && C(i) == 0
        over_mdr = over_mdr + 1;
    end
    if C(i) == 1 && test_label(i) == 0
        over_fdr = over_fdr + 1;
    end
end
mdr = over_mdr/sum_mdr;
fdr = over_fdr/sum_fdr;