---
title: "时间定时器"
date: 2014-05-18 15:48
---

time.Tick会定时触发。与 range 同时使用一旦有时间到来触发业务逻辑
编程模型如下

```
rand.Seed(time.Now().UnixNano())
t := time.Tick(time.Duration(3)*time.Second)
for _ = range t {
    xxxxx
}
```
