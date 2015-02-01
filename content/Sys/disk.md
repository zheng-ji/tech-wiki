---
title: "硬盘相关"
date: 2014-05-18 15:48
---

* 挂载硬盘：

```
sudo umount /dev/vdb
lsblk
sudo apt-get install xfsprogs xfsdump
sudo mkfs.xfs -f /dev/vdb
```

* 编辑 /etc/fstab

```
sudo mount -o defaults,rw,noatime,nodiratime,noikeep,nobarrier,allocsize=8M,attr2,largeio,inode64,swalloc,nobootwait /dev/vdb /data
```

* 扩容硬盘

```
resize2fs /dev/device size
```

* fio 测试

```
fio --bs=4k --size=128m --direct=1 --runtime=10 --rw=randwrite  --numjobs=32 --group_reporting --time_based --name=128m | tee -a iops-32jobs-128m-4k-10sec-randwrite.txt  磁盘性能测试：4k随机写（32线程）
```
