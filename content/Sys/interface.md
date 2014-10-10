---
title: "network interface 设置"
date: 2014-05-18 15:48
---

某次因为卸载掉networkmanager, 不能上网，这个时候看到

/etc/network/interface

```
auto lo
iface lo inet loopback
dns-nameservers 172.16.1.252
```

已经被networkmanger覆盖了

故编辑修改成

```
auto eth0
iface eth0 inet dhcp
```

```
sudo ifconfig eth0 up
```
