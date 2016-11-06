---
title: "route"
date: 2016-11-06 15:48
---

* 显示路由信息

```
route 
route -n 不显示名字
```

* 添加网关 设置网关

```
route add -net 224.0.0.0 netmask 240.0.0.0 dev eth0
```

* 屏蔽一条路由

```
route add -net 224.0.0.0 netmask 240.0.0.0 reject
```

* 删除路由记录

```
route del -net 224.0.0.0 netmask 240.0.0.0
```

* 删除和添加设置默认网关

```
route del default gw 192.168.120.240
route add default gw 192.168.120.240
```



