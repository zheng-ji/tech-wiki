---
title: "irqbalance"
date: 2014-07-15 15:48
---

默认所有的中断处理都集中在cpu0 上，导致服务器负载过高的时候，cpu0 成了瓶颈，而其他cpu 却还闲着,启用 irqbalance 服务，既可以提升性能，又可以降低能耗。

irqbalance 用于优化中断分配，它会自动收集系统数据以分析使用模式，并依据系统负载状况将工作状态置于 Performance mode 或 Power-save mode。

处于 Performance mode 时，irqbalance 会将中断尽可能均匀地分发给各个 CPU core，以充分利用 CPU 多核，提升性能。

处于 Power-save mode 时，irqbalance 会将中断集中分配给第一个 CPU，以保证其它空闲 CPU 的睡眠时间，降低能耗。

启动

```ssh
sudo service irqbalance start
```
