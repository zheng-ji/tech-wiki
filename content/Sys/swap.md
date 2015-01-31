---
title: "swap 使用"
date: 2014-05-18 15:48
---

* 暂时关闭SWAP，重启后恢复

```
swapoff   -a
```


* 永久关闭SWAP
```
vim /etc/fstab
# swap was on /dev/sda11 during installation
#UUID=0a55fdb5-a9d8-4215-80f7-f42f75644f69 none  swap    sw      0       0
```
注释掉SWAP分区项，即可



* 查看SWAP分区大小

```
cat /proc/meminfo
SwapTotal:             0 kB
wapFree:              0 kB
```
如果上面二项目都为0，说明没有swap分区；如果不为0，则说明有此分区

* 将磁盘格式化为swap

```
mkswap /dev/xvdc

swapon /dev/xvdc
```

