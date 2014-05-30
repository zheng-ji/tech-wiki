---
title: "monit"
date: 2014-05-18 15:48
---


### 安装

monit可以监控服务器软件。类似 supervisord 对于python
sudo apt-get install monit


sudo vi /etc/monitrc

反注释掉http块的信息

```
set httpd port 2812 and
    use address localhost  # only accept connection from localhost
    allow localhost        # allow localhost to connect to the server and
```

### 创建监控改程序的monit文件

```
touch /etc/monit/conf.d/mysql.monit
sudo vi mysql.monit
```

内容中，需要

* 程序名
* 程序pidfile 位置
* 程序启动和关闭指令

```
check process mysql with pidfile /var/lib/mysql/precess64.pid
start program = "/etc/init.d/mysql start" 
stop program = "/etc/init.d/mysql stop" 
if failed host 127.0.0.1 port 3306 then restart 
if 3 restarts within 5 cycles then timeout
```

V使用

```
sudo service monit start
sudo monit status
sudo monit monitor mysql 监控mysql
```
