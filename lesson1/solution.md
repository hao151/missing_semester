#### 1:在 /tmp 下新建一个名为 missing 的文件夹
```mkdir tmp```
#### 2:用 touch 在 missing 文件夹中新建一个叫 semester 的文件
```touch semester```
#### 3.使用```./semester```执行该文件
执行时报错：permission denied，使用```ls -l```查看该文件发现该文件没有```x```执行权限。使用```chomd +x semester```可以给该文件增加执行的权限。同时在执行前需要注意是否安装```curl```这个命令.
##### 执行结果如下：
```
HTTP/2 200 
server: GitHub.com
content-type: text/html; charset=utf-8
last-modified: Mon, 08 Jan 2024 22:40:31 GMT
access-control-allow-origin: *
etag: "659c79df-2015"
expires: Wed, 17 Jan 2024 07:02:25 GMT
cache-control: max-age=600
x-proxy-cache: MISS
x-github-request-id: EA8C:3645C0:939F2A:995330:65A77928
accept-ranges: bytes
date: Wed, 17 Jan 2024 07:43:01 GMT
via: 1.1 varnish
age: 0
x-served-by: cache-tyo11981-TYO
x-cache: HIT
x-cache-hits: 1
x-timer: S1705477381.128046,VS0,VE159
vary: Accept-Encoding
x-fastly-request-id: e846d09e25cd3271a192f5276cb3ce6c33ade080
content-length: 8213
```
#### 4.使用 ```|``` 和 ```>``` ，将 ```semester``` 文件输出的最后更改日期信息，写入到 ```~/missing_semester/lesson1/last-modified.txt``` 中
```./semester | grep last-modified > ~/missing_semester/lesson1/last-modified.txt```
```grep```命令：在输入中查找对应字符串

#### 5.写一段命令来从 /sys 中获取笔记本的电量信息，或者台式机 CPU 的温度。
```cat /sys/class/power_supply/BAT0/capacity```


