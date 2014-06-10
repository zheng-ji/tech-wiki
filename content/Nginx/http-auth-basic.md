---
title: "http basic auth"
date: 2014-05-18 15:48
---
访问站点的时候，nginx可以做基本的验证, 它是用cry3加密的

* 进入ngnix配置的地址cd /etc/ngnix 
* 使用命令生成passfile文件：

```
htpasswd -c -d /etc/nginx/pass_file  username
```

* nginx配置

```
location ~ /admin {
    auth_basic "Restricted";
    auth_basic_user_file /etc/nginx/pass_file;//请使用绝对路径
    root   /home/www/admin; //host 地址，不然认证通过之后，找不到对应的文件
} 
```
   


