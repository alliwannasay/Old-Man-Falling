function winResult = get_fall_like_win_real(points,judgeInterval)
len = length(points);
prep = points(1,1);
curp = points(1,1);
winResult = [];
for i = 1:len
    curp = points(1,i);
    if (curp-prep > judgeInterval)
        winResult = [winResult prep];
    end
    prep = curp;
end
prep = points(1,len);
winResult = [winResult prep];
    

    