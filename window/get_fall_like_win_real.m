function winResult = get_fall_like_win_real(ma,points,judgeInterval)
len = length(points);
prep = points(1,1);
curp = points(1,1);
start = points(1,1);
winResult = [];
for i = 1:len
    curp = points(1,i);
    if (curp-prep > judgeInterval)
        dura = [start,prep];
        winResult = [winResult dura'];
        start = curp;
    end
    prep = curp;
end
prep = points(1,len);
dura = [start,prep];
winResult = [winResult dura'];



    

    