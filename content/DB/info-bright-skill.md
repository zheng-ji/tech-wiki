---
title: "infobright 注意的点"
date: 2014-05-18 15:48
---

创建好用户后，发现远程连接会出现

```
Lost connection to MySQL server at 'reading initial communication packet', system error: 0 
```

解决方法：

```
my-ib.cnf [mysqld] 添加 skip-name-resolve
重启ok 
```

python连接，需要指定特别的socket文件

```
conn = MySQLdb.connect(host='xxx',user='xxx',passwd='xxx',db='xxx', unix_socket="/tmp/mysql-ib.sock")
```
