---
title: "clustershell 使用"
date: 2014-05-18 15:48
---

```
sudo apt-get install clustershell
```
编辑 /etc/clustershell/groups

```
#/etc/clustershell/groups
srv:vagrant
```

```
ssh-keygen
```

编辑 ~/.ssh/config
```
# ~/.ssh/config
host vagrant 
     hostname :xxx.xxx.xx.xx
     username 123
```

```
ssh-copy-id -i ~/.ssh/id_dsa.pub vagrant
```
填入密码

```
ssh vagrant
clush -g srv “id”
```

