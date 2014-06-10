---
title: "supervisor 使用"
date: 2014-05-18 15:48
---


### 安装

monit可以监控服务器软件。类似 supervisord 对于python
sudo apt-get install supervisor


sudo vi /etc/supervisor/supervisord.conf
对socket-file权限修改为0777,可以降为 非Root 用户使用

### 重启和reload

```
sudo supervisorctl reload
sudo supervisord
```

在conf.d目录下编辑一个程序的配置文件

```
[program:mpserver]
要执行的命令，这里的“%(process_num)02d”会用2位精度的进程号替换
command=xxxx

# process_name expr (default %(program_name)s)
# 启动的进程的名字，这里的名字只是supervisor内部是别用，与你所启动程序的进程名无关
process_name=%(program_name)s

# 启动几个进程
#numprocs=4

# 运行前cd到此目录
directory=/home/zj/bin/
# supervisord守护程序启动时自动启动
autostart=true

# supervisord守护程序重启时自动重启
autorestart=true

# 运行程序前su到此用户
user=www-data

# 将stderr重定向到stdout
redirect_stderr=true

# 记录控制台输出的日志位置
stderr_logfile=/var/log/err.log
stdout_logfile=/var/log/output.log
```

```
supervisorctl programe stop
supervisorctl programe start
```
