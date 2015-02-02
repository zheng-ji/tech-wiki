---
title: " nginx 限制网速下载"
date: 2014-05-18 15:48
---

用Nginx做下载服务的时候，可能会做下载速度限制，这个Nginx可以做到：
首先在http{}的配置中添加一条：
limit_zone one $binary_remote_addr 10m;然后在server{}的配置中添加：

```
location / {
    limit_conn one 1;  限制线程
    limit_rate 100k;     限制速度
}
```

表示限速100K每个客户端只允许一个线程

限制IP:

```
allow xxx.xxx.xxx.xxx;
deny all;
```

