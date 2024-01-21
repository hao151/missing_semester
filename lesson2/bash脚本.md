#### 脚本
变量定义 ```world=b```注意不要有空格。输出变量时：```echo $world```代表取```world```的值
两条命令可以用```;```都写在同一行。例如```mkdir test; cd test```
将命令的输出储存到另一个变量中：```foo=$(pwd)```(记得用括号括起来，否则会被认为是变量，```shell```会找不到这个变量的值) 
用```{}```可以分隔变量和常量：```echo ${foo}asd```
##### 字符串
用双引号或者单引号引起来都可以，在面对无变量的字符串时两种方法等效。但```"hello $world"```和```'hello $world'```不相等。第一种结果为```hello b``` 第二种结果则为```hello $world```

##### 自定义函数
```$0```代表脚本名称，```$1 ~ $9```表示该脚本接收的参数。
```$?```表示上一个命令的返回值(与C语言类似，返回0代表没异常，其余值代表有异常) 
```$_```表示上一个命令的参数。例如```mkdir test``` 使用命令```cd $_```即可进入```test```文件夹. 
```$#```表示该脚本的参数个数 ```$$```表示该脚本的```PID```
```$@```将所有的参数展开。例如```for file in $@```表示每次循环函数的参数将依次赋值给```file```变量
```!!```表示上一个命令，当执行命令但没有权限的时候```<command>```可以在下一行使用```sudo !!```即可代表上一个命令

##### 进程替换
```<command0> <(<command1>) <(<command2>)```先内部执行```command1、command2```命令后将结果放在两个临时文件中，并将临时文件的文件标识符传给```command0```，让其来对这两个临时文件进行操作

##### 通配符
```ls *.sh```查找所有以```.sh```结尾的文件
```ls project?```查找所有```project```后只接一个字符的文件
```{}```类似多项式展开```touch foo{,1,2,3}```等价于```touch foo foo1 foo2 foo3```多个```{}```结合在一块起到效果类似于笛卡尔积。可以配合区间```{<char1>..<char2>}```来使用。```touch {foo,project}/{a..j}```

##### shebang
解释器开头```#!/usr/bin/python```表示```python```解释器所在的路径，但不同人的```python```解释器存放路径不同，可以替换为```#!/usr/bin/env python```表示在```/usr/bin```下使用环境变量查找```python```解释器，可移植性更强

##### 查找文件
想要查找名为```src```的文件：```find . -name src -type d``` 表示在当前目录下查找名字为```src```类型为文件夹的文件。
也可以查找固定文件夹下的某些文件：```find . -path '**/test/*.py' -type f"```查询当前文件夹下，在```test```文件夹下的所有```.py```文件
对查找出的文件执行统一操作：```find . -name "*.tmp" -exec rm {} \```表示对查找出来的```*.tmp```文件全部删除
```locate```命令也可以,更快。可以查找路径的字符子串来进行查找，是数据库索引优化。

#### 查找字符串
```grep "string" "dir"：```在```dir```文件下查找```string```这一字符串。
也可以递归查找：```grep -R foobar```在该文件夹下递归查找每个文件中的```"foobar"```
查找之前执行过的命令：```history | grep [command you want]``` 或者```ctrl + r```可以反向搜索之前的命令
```fzf```交互查找工具:```command | fzf```
#### ```tldr```可以告诉命令的一些例子，好用。

#### 管道符
只有第一个管道符是在当前```shell```下运行的，其余的都是新开了一个进程子```shell```
管道符只能传标准输入和标准输出，对于参数而言，管道符不起作用。例如```find / -name test.sh | rm ```和```rm -f $(find / -name test.sh)```。后面的命令可以执行，前面的命令报错。有些命令只接受参数而不接受标准输入输出。
下次遇到这样的情况我们怎么辨别哪些命令是接受标准输入，哪些命令接受命令行参数？
答案是：**如果命令能够让终端阻塞，说明该命令接收标准输入，反之就是不接受**，比如你只运行cat命令不加任何参数，终端就会阻塞，等待你输入字符串并回显相同的字符串。
[具体例子](https://juejin.cn/post/6988524802952658975)
有些命令可以通过```xargs```来将标准输入输出转换为命令行参数，如```ls、rm```但有一些命令不可以，例如```cd```,这是因为```cd```是```shell```是内置函数，在环境变量```$PATH```下找不到该命令(因为是shell内置的)
```It is working but it is not meeting your expectations. You expect that, after the cd pipe, your current directory will be the new directory. It doesn't work because only the first command in a pipleine is run in the current shell; the xargs runs in a subshell; in the subshell, cd does work (but you can't see it). When the pipeline has finished the current directory is unchanged because it never was changed in the current shell.```
[具体详情](https://www.linuxquestions.org/questions/linux-newbie-8/xargs-cd-is-not-working-796219/)