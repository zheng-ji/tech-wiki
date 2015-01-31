---
title: "硬盘相关"
date: 2014-05-18 15:48
---

挂载硬盘：

```
sudo umount /dev/vdb
lsblk
sudo apt-get install xfsprogs xfsdump
sudo mkfs.xfs -f /dev/vdb
```

编辑 /etc/fstab

```
sudo mount -o defaults,rw,noatime,nodiratime,noikeep,nobarrier,allocsize=8M,attr2,largeio,inode64,swalloc,nobootwait /dev/vdb /data
```

扩容硬盘

```
resize2fs /dev/device size
```

