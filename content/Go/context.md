### golang 通过 context 控制并发的应用场景

* 多goroutine执行超时通知
并发执行的业务中最常见的就是有协程执行超时, 如果不做超时处理就会出现一个僵尸进程, 这累计的多了就会有一阵手忙脚乱了, 所以我们要在源头上就避免它们

```
func demo() {
    ctx, _ := context.WithTimeout(context.Background(), 9*time.Second)
    go watch(ctx, "[线程1]")
    go watch(ctx, "[线程2]")
    go watch(ctx, "[线程3]")

    index := 0
    for {
        index++
        fmt.Printf("%d 秒过去了 \n", index)
        time.Sleep(1 * time.Second)
        if index > 10 {
            break
        }   
    }   
    fmt.Println("通知停止监控")
    //// 其实此时已经超时, 协程已经提前退出
    //cancel()

    //// 防止主进程提前退出
    time.Sleep(3 * time.Second)
    fmt.Println("done")
}

func watch(ctx context.Context, name string) {
    for {
        select {
        case <-ctx.Done():
            fmt.Printf("%s  监控退出, 停止了...\n", name)
            return
        default:
            fmt.Printf("%s goroutine监控中... \n", name)
            time.Sleep(2 * time.Second)
        }   
    }   
}

func main() {
    fmt.Println("run demo \n\n\n")
    demo()
}

```

* 请求链路传值

一般来说，我们的根 context 会在请求的入口处构造如下 ctx := context.Background()
如果拿捏不准是否需要一个全局的 context，可以使用下面这个函数构造ctx := context.TODO()
```
package main

import (
	"context"
	"fmt"
)

func func1(ctx context.Context) {
	ctx = context.WithValue(ctx, "k1", "v1")
	func2(ctx)
}
func func2(ctx context.Context) {
	fmt.Println(ctx.Value("k1").(string))
}

func main() {
	ctx := context.Background()
	func1(ctx)
}
```

总结：
不要把Context放在结构体中，要以参数的方式传递
以Context作为参数的函数方法，应该把Context作为第一个参数，放在第一位。
给一个函数方法传递Context的时候，不要传递nil，如果不知道传递什么，就使用context.TODO
Context的Value相关方法应该传递必须的数据，不要什么数据都使用这个传递
Context是线程安全的，可以放心的在多个goroutine中传递
