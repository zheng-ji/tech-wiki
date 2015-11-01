---
title: "上下文管理器"
date: 2015-11-01 18:57
---

上下文管理器(context manager)，用于规定某个对象的使用范围。一旦进入或者离开该使用范围，会有特殊操作被调用 (比如为对象分配或者释放内存)。它的语法形式是with...as...

任何定义了__enter__()和__exit__()方法的对象都可以用于上下文管理器。文件对象f是内置对象，所以f自动带有这两个特殊方法，不需要自定义。


```
class VOW(object):
    def __init__(self, text):
        self.text = text
    def __enter__(self):
        self.text = "I say: " + self.text    # add prefix
        return self                          # note: return an object
    def __exit__(self,exc_type,exc_value,traceback):
        self.text = self.text + "!"          # add suffix

with VOW("I'm fine") as myvow:
    print(myvow.text)

print(myvow.text)
```

Resut

```
I say: I'm fine
I say: I'm fine!
```
