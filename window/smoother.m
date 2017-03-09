function smoothma = smoother(ma,m)
[k,n] = size(ma);
avg = (1+m)*m/2;
for i = 1:n
    for t = m:k
        thissum = 0;
        for j = 1:m
            thissum = thissum + j * ma(t-m+j,i);
        end
        ma(t,i) = thissum/avg;
    end
end
smoothma = ma;
        
        
    