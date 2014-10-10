---
title: "upstart 使用"
date: 2014-07-31 15:48
---

假设我的程序是myserver
当我们使用　sudo start myserver
事实上推荐用　upstart


编辑　/etc/init/myserver.conf
``` 
# myserver program
description   "myserver"

limit nofile 1000000 1000000
start on filesystem or runlevel [2345]
stop on runlevel [!2345]

respawn
respawn limit 10 5
umask 022

console none
chdir /home/ubuntu/bin/myserver

script
  exec start-stop-daemon --start --exec /home/zj/bin/myserver -- -c="/home/zj/bin/myserver/etc/conf.yml" >> /tmp/myserver.panic.log 2>&1
end script

```
默认在 /var/log/upstart/可以找到
