//  使用
typ := reflect.TypeOf(Config{})
config, _ = reflect.New(typ).Interface().(*Config)

// 修改
typ := reflect.TypeOf(Config{})
ins := reflect.New(typ).Elem()
ins.Field(1).SetString("ip")

避免使用反射
使用反射赋值，效率非常低下，如果有替代方案，尽可能避免使用反射，特别是会被反复调用的热点代码。例如 RPC 协议中，需要对结构体进行序列化和反序列化，这个时候避免使用 Go 语言自带的 json 的 Marshal 和 Unmarshal 方法，因为标准库中的 json 序列化和反序列化是利用反射实现的。可选的替代方案有 easyjson，在大部分场景下，相比标准库，有 5 倍左右的性能提升。
