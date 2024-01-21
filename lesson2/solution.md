4.本节课我们讲解的 find 命令中的 -exec 参数非常强大，它可以对我们查找的文件进行操作。 如果我们要对所有文件进行操作呢？例如创建一个zip压缩文件？我们已经知道，命令行可以从参数或标准输入接受输入。在用管道连接命令时，我们将标准输出和标准输入连接起来，但是有些命令，例如tar 则需要从参数接受输入。这里我们可以使用xargs 命令，它可以使用标准输入中的内容作为参数。 例如 ls | xargs rm 会删除当前目录中的所有文件。您的任务是编写一个命令，它可以递归地查找文件夹中所有的HTML文件，并将它们压缩成zip文件。注意，即使文件名中包含空格，您的命令也应该能够正确执行（提示：查看 xargs的参数-d）译注：MacOS 上的 xargs没有-d，查看这个issue
```find . -name *.html -type f | xargs -d '\n' tar -cvzf html.zip```

5.编写一个命令或脚本递归的查找文件夹中最近使用的文件。更通用的做法，你可以按照最近的使用时间列出文件吗？
```find . -type f -print0 | xargs -0 ls -lt | head -10```