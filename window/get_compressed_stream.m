function [] = get_compressed_stream(ma)
ma = ma(1:11000,:);
[m,n] = size(ma);
step = 10;
inter = 1:step:m;
ma = ma(inter,:);
vec1 = mean(ma(:,1:30),2);
vec2 = mean(ma(:,31:60),2);
vec3 = mean(ma(:,61:90),2);
% hold on
% scatter(inter,vec1)
% scatter(inter,vec2)
% hold off

% scatter(inter,vec1)
arglof = 15;
lofresult1 = my_LOF(vec1,arglof)
lofresult2 = my_LOF(vec2,arglof)
lofresult = union(lofresult1,lofresult2);
lofresult = lofresult*step

