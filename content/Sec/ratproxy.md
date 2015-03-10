---
title: "ratproxy"
date: 2015-03-10 10:48
---

ratproxy 是 Google 开源的 审计工具

[下载链接](http://code.google.com/p/ratproxy/)

解压后，make 就可以直接使用了。

启动 ratproxy 默认端口是8080 


```
./ratproxy -v logs -w logs/report.log -d www.baidu.com -lextifscgjm
```

* -d 指定的扫描网站
* -w 输出机器可读的报告

浏览器设置代理

```
127.0.0.1:8080
```

开启代理，访问你要使用的网站

使用以下命令生成报告, report.html 就是可读的

```
./ratproxy-report.sh logs/ratporxy.log > report.html
```







