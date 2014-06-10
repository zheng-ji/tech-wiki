---
title: "supervisord + pypy + virtualenv 使用"
date: 2014-05-18 15:48
---

环境搭建：安装pypy：

```
sudo apt-get install pypy
```

安装virtualenv：

```
sudo apt-get install virtualenv
```

创建pypy+virtualenv虚拟环境：在当前目录下创建PYPYENV

```
virtualenv -p /usr/bin/pypy PYPYENV
```

导出原有 python 安装的包列表:

```
pip freeze > list.txt
```

进入virtualenv（PYPYENV）虚拟环境，同时导入list.txt列表：

```
source bin/activate
pip install -r list.txt
```

退出virtualenv虚拟环境：

```
deactivate
```

安装 supervisor：

```
sudo apt-get install supervisor
```

配置supervisor：

vim /etc/supervisor/conf.d/xxxx.conf 代码示例：

```
[program:webserver]
command= runinenv.sh /pathaa/PYPYENV python /path/xxx.py --port=80%(process_num)02d --log_file_prefix=/tmp/xxx-80%(process_num)02d.log
directory=/path
numprocs=4
process_name=%(program_name)s-80%(process_num)02d
autostart=true
autorestart=true
startsecs=3
stdout_logfile=/tmp/xxx.log
0stderr_logfile=/tmp/xxxerror.log
```


* uninenv.sh文件代码示例：

```bash
VENV=$1
if [ -z $VENV ]; then
echo "usage:runinenv [virtualenv_path] CMDS"
exit 1
fi
source ${VENV}/bin/activate
shift 1
echo "Executing $@ in ${VENV}"
exec "$@"
deactivate
```

* supervisord 管理

```
sudo supervisorctl
supervisord > reload
supervisord > status
supervisord > start
supervisord > stop
```

```
upstream xxxx{
    ip_hash;
    server localhost:8001;
    server localhost:8002;
    server localhost:8003;
    server localhost:8004;
}
location / {
    proxy_pass http://xxxx
}
```
