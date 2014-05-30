---
title: "mysql skill"
date: 2014-05-18 15:48
---

* 将数据导出csv文件：
```
select * from t_mis into outfile 'F:\\mytable.csv' fields terminated by ',' optionally enclosed by '"' lines terminated by '\n';
```

* 权限赋予
```
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'newpass';
```

* Mysql Has Gone Away

```
wait_timeout=180 设置长久些
max_allowed_package 可以设置大一点
```

* mysql无法启动Could not find MySQL server (/usr/bin/mysqld_safe)
删除my.cnf rm /etc/mysql/my.cnf

