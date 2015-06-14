---
title: "iostat解义"
date: 2015-06-14 19:16
---

rrqm/s: 每秒进行merge的读操作数目(rmerge/s)
wrqm/s: 每秒进行merge的写操作数目(wmerge/s)
r/s: 每秒完成的读I/O 设备的次数(rio/s)
w/s: 每秒完成的读I/O设备的次数(wio/s)
rsec/s: 每秒读扇区数(rsect/s)
wsec/s: 每秒写扇区数(wsect/s)
rkB/s: 每秒读K字节数
wKB/s: 每秒写K字节数
avgrq-sz: 平均每次设备I/O操作的数据大小
avgqu-sz: 平均I/O队列的长度
await: 平均每次设备I/O等待的时间
svctm: 平均每次设备I/O 操作的服务时间
%uti: 1秒钟有百分之多少时间用于I/O 

如果%util接近100%说明磁盘成为瓶颈，await应该低于5ms
