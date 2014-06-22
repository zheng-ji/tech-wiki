---
title: "彻底删除文件"
date: 2014-05-18 15:48
---

以删除apache为例子
```
$ sudo apt-get --purge remove apache2
$ sudo apt-get --purge remove apache2.2-common
$ sudo apt-get autoremove
```

（关键一步）找到没有删除掉的配置文件，一并删除
```
$ sudo find  /etc -name "*apache*" -exec  rm -rf {} \;
$ sudo rm -rf /var/www
```

