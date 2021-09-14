
Copy-On-Write

写入时复制（英语：Copy-on-write，简称COW）是一种计算机程序设计领域的优化策略。

其核心思想是，如果有多个调用者（callers）同时请求相同资源（如内存或磁盘上的数据存储），他们会共同获取相同的指针指向相同的资源，直到某个调用者试图修改资源的内容时，系统才会真正复制一份专用副本（private copy）给该调用者，而其他调用者所见到的最初的资源仍然保持不变。这过程对其他的调用者都是透明的（transparently）。此作法主要的优点是如果调用者没有修改该资源，就不会有副本（private copy）被创建，因此多个调用者只是读取操作时可以共享同一份资源。
也就是说，在一份共享资源，被多个调用者共同消费时，若出现修改资源的操作，我们并不直接对资源进行修改，而是对将资源修改操作划分为三个步骤：

第一：先将资源进行复制，复制出一个新的资源备份；
第二：往这个资源备份里面添加新的数据；
第三：将原先资源地址指向资源备份的地址。
这样的好处是，我们在读数据时不需要加锁，因为资源是不变的，相对于其他不需要修改资源的调用者来说。这类似与一种读写分离的操作，将写和读两种操作作用于两个不同的地址上，互不干扰。

```
package main

import (
	"fmt"
	"strconv"
)

var testMap map[int]*string

func copyBak() map[int]*string {
	vals := make(map[int]*string)

	for key, value := range testMap {
		vals[key] = value
	}

	return vals
}

func main() {

	testMap = make(map[int]*string)
	str := "123"
	testMap[1] = &str
	testMap[2] = &str
	testMap[3] = &str
	testMap[4] = &str

	go func() {
		for {
			fmt.Println(*testMap[3])
		}
	}()

	go func() {
		for i := 0; i < 100000000; i++ {
			// 写数据是需要加锁的，并发写的情况下，可能会出现copy多份数据的情况
			// 但此处只有一个协程做此操作
			// 1、复制出新的Map
			newVals := copyBak()
			// 2、修改已有的元素，或添加新元素
			str = "12343264364634" + strconv.Itoa(i)
			newVals[3] = &str
			// 3、将原有的Map地址指向新的Map
			testMap = newVals
		}
	}()

	select {}
}
```
修改时锁住的仅仅是资源的一个备份，所以并不会影响到原有资源的正常访问，原有资源依然可以正常访问。

