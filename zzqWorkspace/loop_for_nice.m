function result = loop_for_nice(ma,basicMa,lowPassRate)
result = []
isok = 0
for argEngAntNum = 1:90
    if isok == 1
        break
    end
    for argEngWinSize = 10:50
        if isok == 1
            break
        end
        for argStdWeight = 0:0.01:0.2
            if isok == 1
                break
            end
            t_result = get_ending_points(ma,argEngAntNum,argEngWinSize,argStdWeight,basicMa,lowPassRate);
            t_view = [argEngAntNum, argEngWinSize, argStdWeight]
            for i = 1000:1100
                if ismember(i,result)
                    result = t_result;
                    isok = 1;
                end
            end
        end
    end
end




