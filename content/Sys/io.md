---
title: "IO stat"
date: 2014-05-18 15:48
---

* top 命令定位

```
top - 16:15:05 up 6 days,  6:25,  2 users,  load average: 1.45, 1.77, 2.14
Tasks: 147 total,   1 running, 146 sleeping,   0 stopped,   0 zombie
Cpu(s):  0.2% us,  0.2% sy,  0.0% ni, 86.9% id, 12.6% wa,  0.0% hi,  0.0% si
Mem:   4037872k total,  4003648k used,    34224k free,     5512k buffers
Swap:  7164948k total,   629192k used,  6535756k free,  3511184k cached
```

查看12.6% wa. IO等待所占用的CPU时间的百分比,高过30%时IO压力高

* 用iostat -x 1 10

查看%util 100.10 %idle 66.29
如果 %util 接近 100%，说明产生的I/O请求太多，I/O系统已经满负荷，该磁盘可能存在瓶颈,idle小于70% IO压力就较大了,一般读取速度有较多的wait.
