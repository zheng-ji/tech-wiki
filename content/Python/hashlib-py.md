---
title: "python hashlib模块"
date: 2014-05-18 15:48
---
使用Python中的hashlib来进行hash加密是非学简单的，下面是一段简单代码：

```python
import hashlib  
md5 = hashlib.md5() #创建一个MD5加密对象  
md5.update("JGood is a handsome boy")  #更新要加密的数据  
print md5.digest()  #加密后的结果（二进制）  
print md5.hexdigest() #加密后的结果，用十六进制字符串表示。  
print 'block_size:', md5.block_size  
print 'digest_size:', md5.digest_size  
```


非常的简单，其实如果说加密一个字符串，根本不用写上面这么多代码，一条语句就可以了：

```python
print hashlib.new("md5", "JGood is a handsome boy").hexdigest()  
```




