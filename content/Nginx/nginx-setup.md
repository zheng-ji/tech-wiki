---
title: " nginx 源码安装"
date: 2014-05-18 15:48
---

安装前
```
apt-get install openssl
apt-get install libssl-dev
``` 

```
cd /usr/local/src #系统第三方软件源码安装位置 
sudo wget http://nginx.org/download/nginx-1.7.0.tar.gz 
sudo tar -zxvf nginx-1.7.0.tar.gz cd nginx-1.7.0 
sudo ./configure --sbin-path=/usr/local/nginx/nginx --conf-path=/usr/local/nginx/nginx.conf --pid-path=/usr/local/nginx/nginx.pid --with-http_ssl_module --with-pcre 

```


最后的出现

```
nginx path prefix: "/usr/local/nginx"
nginx binary file: "/usr/local/nginx/nginx"
nginx configuration prefix: "/usr/local/nginx"
nginx configuration file: "/usr/local/nginx/nginx.conf"
nginx pid file: "/usr/local/nginx/nginx.pid"
nginx error log file: "/usr/local/nginx/logs/error.log"
nginx http access log file: "/usr/local/nginx/logs/access.log"
nginx http client request body temporary files: "client_body_temp"
nginx http proxy temporary files: "proxy_temp"
nginx http fastcgi temporary files: "fastcgi_temp"
nginx http uwsgi temporary files: "uwsgi_temp"
nginx http scgi temporary files: "scgi_temp"
```

安装

```
sudo make
sudo make install
```

启动

```
sudo /usr/local/nginx/nginx
```

