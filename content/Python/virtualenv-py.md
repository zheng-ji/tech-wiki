---
title: "virtaulenv 使用"
date: 2014-05-18 15:48
---
`virtualenv`可以将每一个开发项目的运行环境隔离开来，使他们各自使用的库互不干扰

```python
sudo pip install virtualenv
virtualenv .env
source .env/bin/activate
```
可以通过文本安装库,避免一个个手动安装

```pyton
pip install -r requirements.txt
```

看看`requirement.txt`

```python
lxml
cssselect
pymongo
pyquery==1.2.8
tornado==3.1.1
```




