filename = 'datTest.txt';
delimiterIn = '	';	
headerlinesIn = 1;
fuck = importdata(filename,delimiterIn,headerlinesIn);

fuck = dlmread('datTest.txt','\t',1,0)

for i = 1:n
dlmwrite('all.fucked', [1 1 1 2], '-append','delimiter', '\t');
end

mydir=uigetdir('c:','选择一个目录');
if mydir(end)~='\'
 mydir=[mydir,'\'];
end
DIRS=dir([mydir,'*.txt']);  %扩展名
n=length(DIRS);
for i=1:n
 if ~DIRS(i).isdir
  DIRS(i).name  %%%%%%%要载入，做处理，你在这里弄就可以了
 end
end

>> ext = '*.orx'; 
	files = dir(fullfile(filepath,ext)); 
Undefined function or variable 'filepath'.
 
>> filepath = 'd://thu//_ _//_//omf//data//data20161124//'

filepath =

d://thu//_ _//_//omf//data//data20161124//

>> files = dir(fullfile(filepath,ext));
>> ext = '*.dat';
>> files = dir(fullfile(filepath,ext));