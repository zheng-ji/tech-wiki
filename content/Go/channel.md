你可以在多个goroutine从/往 一个channel 中 receive/send 数据, 不必考虑额外的同步措施。Channel可以作为一个先入先出(FIFO)的队列，接收的数据和发送的数据的顺序是一致的。

- chanel 类型
	
	buffered chann 满了，就会阻塞	
	```go
	//带缓冲的channel make 
	// make会分配结构空间及其附属空间，并完成其间的指针初始化,
     make返回这个结构空间，不另外分配一个指针
    ch := make(chan Task, 3)
	```
```
chan T          // 可以接收和发送类型为 T 的数据
chan<- float64  // 只可以用来发送 float64 类型的数据
<-chan int      // 只可以用来接收 int 类型的数据
```
	
- 关闭channel 

```
close(chan)
```
检查是否关闭,它可以用来检查Channel是否已经被关闭了。

在一个已经close的unbuffered channel上执行读操作，会返回channel对应类型的零值，比如bool型channel返回false，int型channel返回0。
向close的channel写则会触发panic。记住 无论读写都不会导致阻塞。
往nil channel中发送数据会一直被阻塞着。

操作	空值(nil)	非空已关闭	非空未关闭
关闭	panic	panic	成功关闭
发送数据	永久阻塞	panic	阻塞或成功发送
接收数据	永久阻塞	永不阻塞	阻塞或者成功接收

```
x, ok = <- c  //从Channel接收一个值，如果channel关闭了或没有数据，那么ok将被置为false
```

对一个没有初始化的channel进行读写操作都将发生阻塞，例子如下：

```
package main

func main() {
	var c chan int
	<-c
}

$ go run testnilchannel.go
fatal error: all goroutines are asleep – deadlock!

func main() {
	var c chan int
	c <- 1
}

$ go run testnilchannel.go
fatal error: all goroutines are asleep – deadlock!
```

- 与select 的配合使用

select语句和switch语句一样，它不是循环，它只会选择一个case来处理，如果想一直处理channel，你可以在外面加一个无限的for循环：x

- range

range c 产生的迭代值为Channel中发送的值，它会一直迭代直到 channel 被关闭。上面的例子中如果把close(c)注释掉，程序会一直阻塞在for …… range那一行。

```
for i := range c {
	fmt.Println(i)
}
```

####  channel 使用场景
本身是个队列, 用于
1. 超时控制, 心跳HeartBeart

```
// 利用 time.After 实现
worker(start chan bool) {
        timeout := time.After(30 * time.Second)
        for {
                select {
                     // … do some stuff
                case <- timeout:
                    return
                }
        }
}

与timeout实现类似，下面是一个简单的心跳select实现：

func worker(start chan bool) {
        heartbeat := time.Tick(30 * time.Second)
        for {
                select {
                     // … do some stuff
                case <- heartbeat:
                    //… do heartbeat stuff
                }
        }
}
```
2 取最快的结果

```
main() {
    ret := make(chan string, 3)
    for i := 0; i < cap(ret); i++ {
        go call(ret)
    }
    fmt.Println(<-ret)
}

func call(ret chan<- string) {
    // do something
    // ...
    ret <- "result"
}
```

3 限制并发
```
// 最大并发数为 2
limits := make(chan struct{}, 2)
for i := 0; i < 10; i++ {
    go func() {
        // 缓冲区满了就会阻塞在这
        limits <- struct{}{}
        do()
        <-limits
    }()
}

4 .广播， 多个 goroutine 同步响应
```
func main() {
    c := make(chan struct{})
    for i := 0; i < 5; i++ {
        go do(c)
    }
    close(c)
}

func do(c <-chan struct{}) {
    // 会阻塞直到收到 close
    <-c
    fmt.Println("hello")
}
```

5. 等待一个事件

这里main goroutine通过"<-c"来等待sub goroutine中的“完成事件”，sub goroutine通过close channel促发这一事件。当然也可以通过向Channel写入一个bool值的方式来作为事件通知。main goroutine在channel c上没有任何数据可读的情况下会阻塞等待
```
import "fmt"

func main() {
        fmt.Println("Begin doing something!")
        c := make(chan bool)
        go func() {
                fmt.Println("Doing something…")
                close(c)
        }()
        <-c
        fmt.Println("Done!")
}
```

#### channel 忘记关闭的陷阱
事实上除了超时场景，其他使用协程(goroutine)的场景，也很容易因为实现不当，导致协程无法退出，随着时间的积累，造成内存耗尽，程序崩溃。

```
造成泄漏的 Case
func do(taskCh chan int) {
	for {
		select {
		case t := <-taskCh:
			time.Sleep(time.Millisecond)
			fmt.Printf("task %d is done\n", t)
		}
	}
}

func sendTasks() {
	taskCh := make(chan int, 10)
	go do(taskCh)
	for i := 0; i < 1000; i++ {
		taskCh <- i
	}
}

func TestDo(t *testing.T) {
    t.Log(runtime.NumGoroutine())
    sendTasks()
	time.Sleep(time.Second)
	t.Log(runtime.NumGoroutine())
}
```

```
正确的样子
func doCheckClose(taskCh chan int) {
	for {
		select {
		case t, beforeClosed := <-taskCh:
			if !beforeClosed {
				fmt.Println("taskCh has been closed")
				return
			}
			time.Sleep(time.Millisecond)
			fmt.Printf("task %d is done\n", t)
		}
	}
}

func sendTasksCheckClose() {
	taskCh := make(chan int, 10)
	go doCheckClose(taskCh)
	for i := 0; i < 1000; i++ {
		taskCh <- i
	}
	close(taskCh)
}

func TestDoCheckClose(t *testing.T) {
	t.Log(runtime.NumGoroutine())
	sendTasksCheckClose()
	time.Sleep(time.Second)
	runtime.GC()
	t.Log(runtime.NumGoroutine())
}
```

---
link: http://colobu.com/2016/04/14/Golang-Channels/
link：https://studygolang.com/articles/11320
