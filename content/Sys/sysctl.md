---
title: "Sysctl 参数释义"
date: 2014-05-18 15:48
---

```
# 避免放大攻击
net.ipv4.icmp_echo_ignore_broadcasts = 1

# 开启恶意icmp错误消息保护
net.ipv4.icmp_ignore_bogus_error_responses = 1

# 开启SYN洪水攻击保护
net.ipv4.tcp_syncookies = 1

# 开启并记录欺骗，源路由和重定向包
net.ipv4.conf.all.log_martians = 1
net.ipv4.conf.default.log_martians = 1

# 处理无源路由的包
net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0

# 开启反向路径过滤
net.ipv4.conf.all.rp_filter = 1
net.ipv4.conf.default.rp_filter = 1


# 不充当路由器
net.ipv4.ip_forward = 0
net.ipv4.conf.all.send_redirects = 0
net.ipv4.conf.default.send_redirects = 0

# 优化LB使用的端口
# 增加系统文件描述符限制
fs.file-max = 65535

# 允许更多的PIDs (减少滚动翻转问题); may break some programs 32768
kernel.pid_max = 65536

# 增加系统IP端口限制
net.ipv4.ip_local_port_range = 2000 65000

# 增加TCP最大缓冲区大小
# tcp timestamp recycle
net.ipv4.tcp_rmem = 4096 87380 8388608
net.ipv4.tcp_wmem = 4096 87380 8388608
net.ipv4.tcp_tw_recycle＝0， 
net.ipv4.tcp_timestamps＝1


# 增加Linux自动调整TCP缓冲区限制, 最小，默认和最大可使用的字节数
net.core.rmem_max = 8388608
net.core.wmem_max = 8388608
net.core.netdev_max_backlog = 5000
net.ipv4.tcp_window_scaling = 1
```

