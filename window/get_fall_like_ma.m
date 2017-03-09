function maResult = get_fall_like_ma(bigma,winResult)
[row,len] = size(winResult);
maResult = cell(1,20);
j = 1;
for i = 1:len
    win = winResult(:,i);
    wint = win';
    s = wint(:,1);
    e = wint(:,2);
    % [s,e] = wint;
    thisma = bigma(s:e,:);
    [t,an] = size(thisma);
    if t >= 50
        maResult{j} = thisma;
        j=j+1;
    end
end