### 备忘-Golang的pprof

#### 使用场景：

1 runtime/pprof
手动调用runtime.StartCPUProfile/runtime.StopCPUProfile等API来进行数据的采集。
优点：灵活性高、按需采集。
使用场景：工具型应用（比如说定制化的分析小工具、集成到公司监控系统）

### Example Code

```
package main

import (
	"fmt"
	"os"
	"runtime/pprof"
	"time"
)

// 一段有问题的代码
func do() {
	var c chan int
	for {
		select {
		case v := <-c:
			fmt.Printf("我是有问题的那一行，因为收不到值：%v", v)
		default:
		}
	}
}

func main() {

	// 创建分析文件
	file, err := os.Create("./cpu.prof")
	if err != nil {
		fmt.Printf("创建采集文件失败, err:%v\n", err)
		return
	}

	// 进行cpu数据的获取
	pprof.StartCPUProfile(file)
	defer pprof.StopCPUProfile()

	// 执行一段有问题的代码
	for i := 0; i < 4; i++ {
		go do()
	}
	time.Sleep(10 * time.Second)
}

```
go run pprof.go 然后会得到数据采集文件：cpu.prof

### 使用方法
* 命令行查看的方法 

go tool pprof cpu.prof
接着使用如下命令可以查看
1. top
2. list FunctionName

*.  浏览器可以查看
go tool pprof -http=:6060 mem.pprof

* 打印 PDF 文件查看
go tool pprof -pdf cpu.prof

###  HTTP 使用的方式
net/http/pprof
通过http服务来获取Profile采样文件。 import _ "net/http/pprof"
优点：简单易用。
使用场景：在线服务（一直运行着的程序）

#### Example Code

```
package main

import (
	"fmt"
	"net/http"
    _ "net/http/pprof"  // 第一步～
)

// 一段有问题的代码
func do() {
	var c chan int
	for {
		select {
		case v := <-c:
			fmt.Printf("我是有问题的那一行，因为收不到值：%v", v)
		default:
		}
	}
}

func main() {
	// 执行一段有问题的代码
	for i := 0; i < 4; i++ {
		go do()
	}
	http.ListenAndServe("0.0.0.0:6061", nil)
}
```

* 浏览器查看
http://127.0.0.1:6061/debug/pprof/

* 命令行查看
go tool pprof http://127.0.0.1:6060/debug/pprof/profile 之后可以执行 "top", "list functionName" 等操作
go tool pprof -pdf http://127.0.0.1:6060/debug/pprof/profile
