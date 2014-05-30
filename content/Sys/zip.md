---
title: "压缩&解压cmd汇总"
date: 2014-05-18 15:48
---

`.tar`

- 解包：tar xvf FileName.tar
- 打包：tar cvf FileName.tar DirName 

---

`.gz`

- 解压：gzip -d FileName.gz
- 压缩：gzip FileName 

---

`.tar.gz 和 .tgz`

- 解压：tar zxvf FileName.tar.gz
- 压缩：tar zcvf FileName.tar.gz DirName 
---

`.bz2`

- 解压：bzip2 -d FileName.bz2
- 压缩： bzip2 -z FileName
---

`.tar.bz2`

- 解压：tar jxvf FileName.tar.bz2
- 压缩：tar jcvf FileName.tar.bz2 DirName
---

`.zip`

- 解压：unzip FileName.zip
- 压缩：zip FileName.zip DirName
压缩一个目录使用 -r 参数，-r 递归。例： $ zip -r FileName.zip DirName
---

`.rar`

- 解压：rar x FileName.rar
- 压缩：rar a FileName.rar DirName 
