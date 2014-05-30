---
title: "golang channel"
date: 2014-05-18 15:48
---

* close twice

```golang
ch := make(chan bool)
close(ch)
close(ch)  // 这样会panic的，channel不能close两次
```

* 读取的时候channel提前关闭了

```golang
ch := make(chan string)
close(ch)
i := <- ch // 不会panic, i读取到的值是空 "",  如果channel是bool的，那么读取到的是false
```
* 向已经关闭的channel写数据

```golang
ch := make(chan string)
close(ch)
ch <- "good" // 会panic的
```

判断channel是否close

```golang
i, ok := <- ch
if ok {
    println(i)
} else {
    println("channel closed")
}
```


* for循环读取channel

```golang
for i := range ch { // ch关闭时，for循环会自动结束
    println(i)
}
```

* 防止读取超时

```golang
select {
    case <- time.After(time.Second*2):
        println("read channel timeout")
    case i := <- ch:
        println(i)
}
```

