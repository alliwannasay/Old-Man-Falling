function stdResult = get_antennae_std_vec(ma)
stdVec = [];
[m,n] = size(ma);
for i = 1:n
    col = ma(:,i);
    vec = col';
    vecstd = std(vec);
    stdVec = [stdVec vecstd];
end
stdResult = stdVec;
    