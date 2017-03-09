function [] = add_noise(filenameIn, filenameOut)
	% http://cn.mathworks.com/help/matlab/ref/dlmwrite.html
	[data,argButterRate,argWinSize,argAtContainThre,argStdWeight,label] = pretreat(filenameIn);

	[m,n] = size(data);

	whatever = 7.5
	temp = ones(m,n) ./ (2 * whatever);
	re = rand(m,n) ./ whatever - temp;
	im = (rand(m,n) ./ whatever - temp) * i;

	for ix = 1:m
		for iy = 1:n
			tr = randi([0,10]) - 5;
			tt = randi([1,200]);
			if tt == 1
				re(ix,iy) = re(ix,iy) + tr;
			end
		end
	end
	for ix = 1:m
		for iy = 1:n
			tr = randi([0,10]) - 5;
			tt = randi([1,200]);
			if tt == 1
				im(ix,iy) = im(ix,iy) + tr*i;
			end
		end
	end

	result = data + re + im;
    head = [argButterRate,argWinSize,argAtContainThre,argStdWeight,label];
    dlmwrite(filenameOut, head);
	dlmwrite(filenameOut,data,'-append','delimiter','\t');
