function [data,argButterRate,argWinSize,argAtContainThre,argStdWeight,label] = pretreat(filename)
	% data = [];
	% startPoint = 0;
	% argButterRate = 0;
	% argWinSize = 0;
	% argAtContainThre = 0;
	% argStdWeight = 0;
	% label = 0;

	data = dlmread(filename,'\t',1,0);
	headerline = dlmread(filename,',',[0 0 0 4]);
	% startPoint = headerline(1);
	argButterRate = headerline(1);
	argWinSize = headerline(2);
	argAtContainThre = headerline(3);
	argStdWeight = headerline(4);
	label = headerline(5);
