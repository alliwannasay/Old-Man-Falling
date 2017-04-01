function [] = draw_picture_with_rect(ma,rectlist)
ma = ma(:,:);
[m,n] = size(ma);
inter = 1:1:m;
ma = ma(inter,:);
vec1 = mean(ma(:,1:30),2);
vec2 = mean(ma(:,31:60),2);
vec3 = mean(ma(:,61:90),2);
toShow = vec1;
hold on
scatter(inter,vec1)
scatter(inter,vec2)
scatter(inter,vec3)
[rm,rn] = size(rectlist);
for i = 1:rm
    left = rectlist(i,1);
    right = rectlist(i,2);
    maxa = max(toShow(left:right));
    H = rectangle('Position',[left,0.1,right-left,maxa+0.1],'Curvature',[0,0],...
          'EdgeColor','r','LineStyle','--','LineWidth',0.5);
end


hold off

