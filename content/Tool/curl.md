---
title: "curl"
date: 2014-05-18 15:48
---

一、查看网页源码
直接在curl命令后加上网址，就可以看到网页源码。我们以网址www.sina.com为例（选择该网址，主要因为它的网页代码较短）

```
curl www.sina.com
```

如果要把这个网页保存下来，可以使用-o参数，这就相当于使用wget命令了。

```
curl -o [文件名] www.sina.com
```

二、自动跳转
有的网址是自动跳转的。使用-L参数，curl就会跳转到新的网址。

```
curl -L www.sina.com
```

键入上面的命令，结果就自动跳转为www.sina.com.cn。

三、显示头信息

-i参数可以显示http response的头信息，连同网页代码一起。

```
curl -i www.sina.com
```

-I参数则是只显示http response的头信息。

四、显示通信过程

-v参数可以显示一次http通信的整个过程，包括端口连接和http request头信息。

```
curl -v www.sina.com
```

下面的命令可以查看更详细的通信过程。

```
curl --trace output.txt www.sina.com
```

或者

```
curl --trace-ascii output.txt www.sina.com
```
运行后，请打开output.txt文件查看。

五、发送表单信息

发送表单信息有GET和POST两种方法。GET方法相对简单，只要把数据附在网址后面就行。

```
curl example.com/form.cgi?data=xxx
```

POST方法必须把数据和网址分开，curl就要用到--data参数。

```
curl --data "data=xxx" example.com/form.cgi
```

如果你的数据没有经过表单编码，还可以让curl为你编码，参数是--data-urlencode。

```
curl --data-urlencode "date=April 1" example.com/form.cgi
```

六、HTTP动词

curl默认的HTTP动词是GET，使用-X参数可以支持其他动词。

```
curl -X POST www.example.com
curl -X DELETE www.example.com
```

七、文件上传

假定文件上传的表单是下面这样：

```
<form method="POST" enctype='multipart/form-data' action="upload.cgi">
　　<input type=file name=upload>
　　<input type=submit name=press value="OK">
</form>

curl --form upload=@localfilename --form press=OK [URL]
```

八、Referer字段

有时你需要在http request头信息中，提供一个referer字段，表示你是从哪里跳转过来的。

```
curl --referer http://www.example.com http://www.example.com
```

九、User Agent字段

这个字段是用来表示客户端的设备信息。服务器有时会根据这个字段，针对不同设备，返回不同格式的网页，比如手机版和桌面版。
curl可以这样模拟：

```
curl --user-agent "[User Agent]" [URL]
```

十、cookie

使用--cookie参数，可以让curl发送cookie。

```
curl --cookie "name=xxx" www.example.com
```

至于具体的cookie的值，可以从http response头信息的Set-Cookie字段中得到。

十一、增加头信息

有时需要在http request之中，自行增加一个头信息。--header参数就可以起到这个作用。

```
curl --header "xxx: xxxxxx" http://example.com
```

十二、HTTP认证

有些网域需要HTTP认证，这时curl需要用到--user参数。

```
curl --user name:password example.com
```


十三、配置Host访问

```
curl -H "host:baidu.com" http://123.123.123.123/ping

```
