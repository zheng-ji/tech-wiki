### 如何成为Go 高手

- 掌握语言的特性
	- 深刻了解 channel
	- io.reader bufio
	- make new
	- Goroutine
	- 锁 waitgroup condLock 
	- 内建函数 copy append
	- panic error
	- 特别的数据结构：container,map 内存分配
	- 特别的类型：如rune
	- 深刻了解 interface
	- context
	- struct 继承
	
-  能够用GO去解决，生产环境中一个具体和完整的问题。已经形成了一套自己的惯用法和常用代码库。
	- 服务器开发模式，要归纳掌握工程实践
		- 连接池
			- mysql 库是如何实现的
			- redis 库是如何实现的
			- kafkaconsumer 怎么做到的
			
		- 优雅重启
			- go1.8 特性
			- facebook的方式
			
		- 通讯的方式选择
			- json 
				- 学习simplejson or fastjson
			- grpc
				- 会使用他的代码
				- 知道他的特点
			
		- 日志
			- 有什么不错的日志实现方式
			- 有什么不错的日志库
			
		- 内存，CPU debug
			- profile的眼里
			- 火焰图使用
			
		- 异常处理
			- 对error的使用
			- 单元测试
		
		- 分布式
			- 一致性hash 
			- 分布式锁
				- redis
				- zookeeper
			- 服务自发现
		
	- 网络编程
	  - Web 开发
			- 不同库抉择点
			- webgo
			- fasthttp
			
	  - tcp udp 编程
	  		- 三次握手 tcpdump 如何去定位
	  		- 四次挥手
	  		- timewait
	  		还有很多要补充
	  	
	  - 善于分析、归纳
	  		- 秒杀
	  		- 限制流量
	 
			
- 清楚Go语言的设计选择和背后的动机。能理解的简洁和可组合性哲学
 