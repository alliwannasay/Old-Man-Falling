function [data,startPoint,argButterRate,argWinSize,argAtContainThre,argStdWeight,label] = pretreat(filename)
	% data = [];
	% startPoint = 0;
	% argButterRate = 0;
	% argWinSize = 0;
	% argAtContainThre = 0;
	% argStdWeight = 0;
	% label = 0;

	data = dlmread(filename,'\t',1,0)
	headerline = dlmread(filename,',',[0 0 0 5])
	startPoint = headerline(1);
	argButterRate = headerline(2);
	argWinSize = headerline(3);
	argAtContainThre = headerline(4);
	argStdWeight = headerline(5);
	label = headerline(6);
