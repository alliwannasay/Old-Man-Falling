截区间方法：
首先将test.m main_lof.m manually_save_lof.m三个文件的第一行
oriFile设置成要处理的文件 不加后缀（注意要处理的文件后缀必须是dat，如果不是，手动把原文件名改一下）
先运行test.m 看一看截点记下来 如果某一根天线数据完全不能看，就是说基本上是平的看不出区别，在get_compressed_stream.m中的19行把这个天线的去掉，比如变成lofresult = [lofresult1;lofresult2]之类的。
再运行main_lof.m 看一看输出的lofresult,如果输出结果太少，把arglof降一降。记下和你之前用眼看的差不多的截点
再在manually_save_lof.m中
lofresultyes = [];
lofresultno = [];
中加上这些截点。
这里save文件的时候：

如果是sit的数据
save_in_dat_lof
如果是fall的数据
save_in_dat_lof_fall

注意下面两个循环的save函数都要改

