---
title: "flask 的配置"
date: 2014-05-18 15:48
---

uwsgi + gevent + flask 威力很大

```python
sudo apt-get install uwsgi
```

可以通过文本安装库,避免一个个手动安装


在 `/etc/uwsgi/app-enabled` 目录下有启动项目的 ini 文件


```
cat /etc/uwsgi/app-enabled/my-projcet.ini root@web01
[uwsgi]
auto-procname = true
procname-prefix-spaced = my-project
socket = /tmp/uwsgi-my-project.sock
master = true
wsgi-file = wsgi_handler.py
callable = app
touch-reload = /home/dev/my-project/reload
uid = zj
gid = zj
processes = 2
max-requests = 100000
daemonize = /home/dev/log/uwsgi.log
disable-logging = true
virtualenv = /home/dev/my-project/virtualenv
chdir = /home/dev/my-project/
gevent = 100
gevent-monkey-patch = true
stats = 127.0.0.1:9191
```

启动uwsgi

```
sudo service uwsgi start
```


nginx 配置

```
location / {
    include     uwsgi_params;
    uwsgi_pass  unix:/tmp/uwsgi-my-project.sock;
}
```








