---
title: "infobright 安装"
date: 2014-05-18 15:48
---

在官网下载deb包,安装

```
dpkg -i infobright_version_name.deb
```

执行脚本

```
/usr/local/infobright/postconfig.sh
```

You can run this script at any time after installation to change the datadir, CacheFolder, socket, and port. The script must be run as root and ICE must not be running.

启动&关闭

```
/etc/init.d/mysqld-ib start
/etc/init.d/mysqld-ib stop
```

客户端连接
```
/usr/bin/mysql-ib [optional:db_name]
```

删除
```
rpm -e infobright
dpkg -r infobright 
```

设置密码,并登录
```
/usr/local/infobright-version-x86_64/bin/mysqladmin -u root password ‘newpass’
/usr/local/infobright-version-x86_64/bin/mysql -u root -p
```
