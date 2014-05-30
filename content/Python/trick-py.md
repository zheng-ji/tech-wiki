---
title: "python 小技巧"
date: 2014-05-18 15:48
---

* ##`*`号传参数##
 
一个`*`加上形参名的方式来表示这个函数的实参个数不定，可能为0个也可能为n个。注意一点是，不管有多少个，在函数内部都被存放在以形参名为标识符的tuple中。

---

* ##join 的使用, 多于组装字符串##

```python
 def gen_key( *args):
    return ":".join(str(item) for item in args)
```
---

* ##yield 使用##
个人认为yield在函数中的作用就是保持函数当前的状态，并返回一个值

```python
def test():
    print 'Hello'
    yield 'world'
t = test()
t.next()
```

输出了：

```
Hello
world
```
 
试试这个,有感性认识了。
 
```python
def fib(max):
    a,b = 0,1
    while a < max:
        yield a
        a, b = b, a + b
for n in fib(1000):
  print n
```

---

* ##partial 偏函数##

函数式编程的思想。可以理解成绑定了一部分参数的函数。作用就是少传参数，更短，更简洁。

```python
from datetime import datetime,timedelta  
def GetNextDay(baseday,n):  
    return str((datetime.strptime(str(baseday),'%Y-%m-%d') + timedelta(days=n)).date())  
``` 


按照常规做法，要获取这些“x日”的日期，需要

```python
GetNextDay(selected_day,1)  
GetNextDay(selected_day,2)  
GetNextDay(selected_day,6)  
GetNextDay(selected_day,13)  
GetNextDay(selected_day,29)  
```

这时候偏函数派上用途了。

```python
import functools  
nday = functools.partial(GetNextDay,selected_day)  

nday(1)  
nday(2)  
nday(6)  
nday(13)  
nday(29)  
```
这样上面的的代码就可以简化成下面这样了。

---
* ##python @ 符号使用##

```python
@dec1
@dec2
def test(arg):
    pass
```
类似于

```python
dec1(dec2(test(arg)))
```
修饰函数还可以带参数。
```python
@dec1(arg1,arg2)
def test(testarg)
```
效果类似于
```
dec1(arg1,arg2)(test(arg))
```

---
* ##各种字符串使用##

去空格及特殊符号
 
```python
s.strip() .lstrip() .rstrip(',')  
```

查找字符 

```python
sStr= 'strchr'  
sStr = 's'  
nPos = sStr1.index(sStr)  
print nPos
```  

将字符串中的大小写转换 

```python
sStr= 'JCstrlwr'  
sStr= sStr1.upper()  
sStr= sStr1.lower()  
```

分割字符串 
```python
s = 'ab,cde,fgh,ijk'  
print(s.split(','))
```

替换字符
```python
s = s.replace(',','');
```

---
* ##python去重##

```python
{}.fromkeys(list).keys()
```

或者

```python
a = [1,2,3,3,2,4]
b = set()
a = list(set(a))
```
