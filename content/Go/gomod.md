要启用go module支持首先要设置环境变量GO111MODULE，通过它可以开启或关闭模块支持，它有三个可选值：off、on、auto，默认值是auto。

1. GO111MODULE=off禁用模块支持，编译时会从GOPATH和vendor文件夹中查找包。

2. GO111MODULE=on启用模块支持，编译时会忽略GOPATH和vendor文件夹，只根据 go.mod下载依赖，将依赖下载至%GOPATH%/pkg/mod/ 目录下。
3. GO111MODULE=auto，当项目在$GOPATH/src外且项目根目录有go.mod文件时，开启模块支持。

```
go mod download    下载依赖的module到本地cache（默认为$GOPATH/pkg/mod目录）
go mod edit        编辑go.mod文件
go mod graph       打印模块依赖图
go mod init        初始化当前文件夹, 创建go.mod文件
go mod tidy        增加缺少的module，删除无用的module
go mod vendor      将依赖复制到vendor下
go mod verify      校验依赖
go mod why         解释为什么需要依赖
```

二、包和调用文件在同一项目下
例如：

moduledemo
├── go.mod
├── main.go
└── mypackage
    └── mypackage.go  // package mp 定义包名为 mp

步骤：

在项目下创建一个 go.mod 文件，在 go.mod 文件中添加以下代码

```
module moduledemo  // 设定 moduledemo 为包根目录名，可以随意改变该名字，只需要导入时一致就好
go 1.14  // 表明版本
```

导入想要的包文件
import "moduledemo/mypackage" // 这里是导入包目录下的包文件名
使用包文件

mp.MyPackage() // 使用包中的 MyPackage() 函数
三、包和被调用文件不在同一个项目下
例如：

├── moduledemo
│   ├── go.mod
│   └── main.go
└── mypackage
    ├── go.mod
        └── mypackage.go  // package mp 定义包名为 mp
步骤

在 mypackage 下面创建 go.mod 文件，并添加以下代码

```
module mypackage
go 1.14
```

在 moduledemo 下面创建 go.mod 文件，并添加以下代码
```
module moduledemo
go 1.14
```

```
require mypackage v0.0.0  // 这个会在你执行 go build 之后自动在该文件添加
replace mypackage => ../mypackage  // 指定需要的包目录去后面这个路径中寻找
```

导入和使用
```
import "mypackage"  // 因为该包目录本身就是包文件所以无需添加下一级路径

mp.MyPackage()  // 使用包中的 MyPackage() 函数
```
