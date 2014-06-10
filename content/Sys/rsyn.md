---
title: "rsync 使用"
date: 2014-05-18 15:48
---

编辑 /etc/rsyncd.conf

```
[myproject]
path=/home/zj/app
read only=yes
host allow=xxxxx
host deny=*
```

客户端

```
rsync -av -P [host]::my-project/d1/ /mnt/data/d1
```

