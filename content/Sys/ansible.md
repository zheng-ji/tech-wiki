---
title: "ansible 命令"
date: 2014-05-18 15:48
---

* 安装

```
sudo apt-get install ansible 
or
sudo pip install ansible
------

* 生成ssh-key

在指挥机： ssh-keygen 生成key
将公钥发送给将要管理的机器 
ssh-copy-id -i id_rsa xx@xxxxxxx

编辑 /etc/ansible/hosts , 添加组

```
[webservers]
23.226.225.46
```

* 使用

```
zj@zheng-ji:/etc/ansible$ ansible -i hosts all -m ping -u zj
23.226.225.46 | success >> {
    "changed": false,
    "ping": "pong"
}

zj@zheng-ji:/etc/ansible$ ansible  all -m ping -u zj
23.226.225.46 | success >> {
    "changed": false,
    "ping": "pong"
}
```

* adhoc

```
ansible vm -m raw -a 'sudo pip install virtualenv' -uvagrant
```


