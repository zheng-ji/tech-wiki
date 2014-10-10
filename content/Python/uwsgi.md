---
title: "uwsgi 使用"
date: 2014-05-18 15:48
---
`uwsgi` 注定和`django`分不开的了

```python
sudo pip install uwsgi
```

可以通过文本安装库,避免一个个手动安装


在 `/etc/uwsgi/app-enabled` 目录下有启动项目的 ini 文件

```pyton
[uwsgi]
socket = /tmp/zheng-ji.sock
chdir = /home/zj/myproject
module = config.wsgi
workers = 2
master = True
vacuum = True
#enable-threads = True
#threads = 40
max-requests = 5000
disable-logging = True
touch-reload = /home/zj/myproject/reload.txt
virtualenv = /home/zj/myproject/.env
```

启动uwsgi
```
sudo service uwsgi start
```


nginx 配置

```
location / {
    include     uwsgi_params;
    uwsgi_pass  unix:/tmp/zheng-ji.sock;
}
```
sudo nginx -s reload

如果希望触发重启，可以touch reload.txt







