---
title: "vagrant 使用"
date: 2014-05-23 15:48
---

需要　`virtualbox` & `vagrant`

```python
sudo apt-get install virutalbox
sudo apt-get install vagrant
```

启动虚拟机

```
vagrant init precise32 http://files.vagrantup.com/precise32.box
vagrant up
```

Vagrantfile 可以配置转发端口

基本命令

```
$ vagrant box add NAME URL    #添加一个box

$ vagrant box list            #查看本地已添加的box

$ vagrant box remove NAME virtualbox #删除本地已添加的box，如若是版本1.0.x，执行$ vagrant box remove  NAME

$ vagrant init NAME          #初始化，实质应是创建Vagrantfile文件

$ vagrant up                   #启动虚拟机

$ vagrant halt                 #关闭虚拟机

$ vagrant destroy            #销毁虚拟机

$ vagrant reload             #重启虚拟机

$ vagrant package            #当前正在运行的VirtualBox虚拟环境打包成一个可重复使用的box

$ vagrant ssh                 #进入虚拟环境

$ vagrant reload    #重启后可看到虚拟机中已经安装好了apache

```

