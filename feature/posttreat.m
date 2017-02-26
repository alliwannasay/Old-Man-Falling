function [] = posttreat(filename,label,f)
	% http://cn.mathworks.com/help/matlab/ref/dlmwrite.html
	singleLine = [label f]
	dlmwrite(filename,singleLine,'-append','delimiter','\t');
