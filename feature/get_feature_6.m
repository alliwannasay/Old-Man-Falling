function [result] = get_feature_6(data)
	% FEATURE 6: Velocity of signal change
	% @alliwannasay @alliwannasay @alliwannasay 
	% (useless) http://52brain.com/thread-28504-1-1.htmlhttp://52brain.com/thread-28504-1-1.html
	clear i;

	q1 = prctile(data,25);
	q2 = prctile(data,50);
	q3 = prctile(data,75);
	q = [q1 q2 q3];

	re = mean(q);
	im = var(q);

	result = re + im * i;
	