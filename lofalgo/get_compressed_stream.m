function outlierPs = get_compressed_stream(ma,argstep,arglof,argInterval)
ma = ma(1:11000,:);
[m,n] = size(ma);
inter = 1:argstep:m;
ma = ma(inter,:);
vec1 = mean(ma(:,1:30),2);
vec2 = mean(ma(:,31:60),2);
vec3 = mean(ma(:,61:90),2);
% hold on
% scatter(inter,vec1)
% scatter(inter,vec2)
% hold off

% scatter(inter,vec1)

lofresult1 = my_LOF(vec1,arglof);
lofresult2 = my_LOF(vec2,arglof);
lofresult = [lofresult1;lofresult2];
lofresult(:,1) = lofresult(:,1)*argstep;
lofresult = flipud(sortrows(lofresult,2))
outlierPs = get_outlier_classified(lofresult,argInterval)

