---
title: "ansible 使用"
date: 2014-05-18 15:48
---

* 安装

```
sudo apt-get install ansible 
or
sudo pip install ansible
```

* 生成ssh-key, ssh 认证

在指挥机： ssh-keygen 生成key 将公钥发送给将要管理的机器 

```
ssh-copy-id -i id_rsa xx@xxxxxxx
```

* 编辑 /etc/ansible/hosts , 添加组

```
[webservers]
23.226.225.46
```

* 使用

```
$ ansible -i hosts all -m ping -u zj
```

* adhoc 是直接执行简单的命令

```
ansible webservers -m raw -a 'sudo pip install virtualenv' -uvagrant
```

* ansible-playbook 才是主角, 它是基于yaml格式,运行,--ask-sudo-pass 是为了提权需要密码

```
ansible-playbook deploy.yaml --ask-sudo-pass
```

以下是deploy.yaml 该wiki就是如此发布的


```
   -hosts: webservers 
    vars:
       src: readme
       des: readme
    remote_user: zj
    tasks:
       - name: make sure nginx is running
         service: name=nginx state=started
         sudo: yes

       - name: transfer file
         template: src={{src}} dest={{des}}

       - name:  generate wiki
         shell: cd ~/mywiki && simiki generate 

       - name:  start wiki
         shell: sudo restart wiki
         sudo: yes
```

返回

```
PLAY [webservers] ************************************************************* 

GATHERING FACTS *************************************************************** 
ok: [23.226.225.46]

TASK: [make sure nginx is running] ******************************************** 
ok: [23.226.225.46]

TASK: [transfer file] ******************************************** 
changed: [23.226.225.46]

TASK: [wiki] ****************************************************************** 
changed: [23.226.225.46]

TASK: [start wiki] ************************************************************ 
changed: [23.226.225.46]

PLAY RECAP ******************************************************************** 
23.226.225.46              : ok=5    changed=3    unreachable=0    failed=0   

```
[ansible](docs.ansible.com)
