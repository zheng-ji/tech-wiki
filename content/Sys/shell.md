---
title: "shell 技巧"
date: 2014-05-18 15:48
---

* shift 使用
```
#!/bin/bash
until [ $# -eq 0 ]
do
echo "$@"
shift
done
```

Shift命令一次移动参数的个数由其所带的参数指定。例如当shell程序处理完前九个命令行参数后，可以使用shift 9命令把$10移到$1 重要用途,Bash定义了9个位置变量，从$1到$9,这并不意味着用户在命令行只能使用9个参数，借助shift命令可以访问多于9个的参数

看见作用了吧。每次运行shift(不带参数的),销毁一个参数，后面的参数前移
输出如下

```
# ./test.sh 1 2 3 4 5 6 7 8 9 10
1 2 3 4 5 6 7 8 9 10
2 3 4 5 6 7 8 9 10
3 4 5 6 7 8 9 10
4 5 6 7 8 9 10
5 6 7 8 9 10
6 7 8 9 10
7 8 9 10
8 9 10
9 10
10 
```

--------

查看当前链接状态, awk中NF是最后一个字段

```
netstat -na | awk '/^tcp/ {++S[$NF]} END {for(a in S) print a, S[a]}'
```

删除太多文件，需要

```
ls|xargs rm -f
```

* for 循环

```
#!/bin/bash
for file in $(ls /tmp/test/ | grep sh)
do
    echo $file
done

for ((i=0;i<10;i++))
do
    echo -n $i //去掉换行符
done

for i in $(seq 1 10)
do
    echo -n $i
done
```

* while 循环

```
#!/bin/bash
i = 0
while ((i<10)) //双括号
do
    echo $i
    ((i += 1))
done

i = 0
while [ $i -lt 10 ] // zhonguoh内测两边有空格
do
    echo $i
    let "i+=1"
done
exit
```

* if 语句

```
#!/bin/bash
if [ $num -lt 60 ]
then
    echo "xx"
elif [ $num -lt 70 ] && [ $num -ge 60 ]
then
    echo "xxx"
else
    echo "xxxx"
fi
exit 0
```

* case 语句

```
#!/bin/bash
case $1 in
    start)
    echo "start ok"
    ;;
    stop)
    echo  "stop ok"
    ;;
    restart)
    echo "restart ok"
    ;;
    *)
    echo  "no param"
    ;;
esac
exit 0
```
