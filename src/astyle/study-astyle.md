study-astyle
============

astyle是一个开源工具，支持C/C++和java，它可以方便的将代码格式化成自己想要的样式而不必人工修改。

`Home Page: http://astyle.sourceforge.net/`

`Project Page: https://sourceforge.net/projects/astyle/`

## 支持语言

- C/C++
- java


## 使用

### 安装

- 源码安装


- apt安装

    sudo apt install astyle

### 参数

参数            | 解释
----------------|-------------
-C              | 类中public,pretected,private关键字，一个tab的缩进
-S              | switch中case关键字，一个tab的缩进
-K              | switch中case关键字，无缩进
-N              | 被namespace包含的block，一个tab的缩进
-w              | 格式化多行的宏定义
-c              | 将tab转化为对应个数的空格
--mode=xx       | 格式化的文件类型，`=c`表示格式C/C++类型(默认类型)，`=java`表示格式java源文件
--suffix=##     | `=none`表示不保存文件，`=##`保存的文件以##结尾，默认是`.orig`
--exclude=##    | 优化时不包含“##”文件或目录
-Z              | 修改后保持文件的修改时间不变
-X              | 将错误信息输出到标准输出设备（stdout），而不是标准错误设备（stderr）
-Q              | 只显示格式化前后发生变化的文件
-q              | 不输出任何信息
-z1             | 使用windows版本的回车符(CRLF)
-z2             | 使用linux版本的回车符(LF)
--help          | 显示帮助信息
-v              | 显示版本信息

### 例子

- 下面的命令可以一次性格式化某个目录下所有的源文件和头文件，非常好用，标记一下。
```c
for /R %f in (*.cpp;*.c;*.h) do astyle --style=ansi  "%f"
```

* 按照`kr`格式化一个文件

```c
astyle --style=kr demo.c
```

* `-r`: 递归格式化

```c
astyle --style=kr -r *.c
```

* `-s`: 用空格代替tab键

```c
astyle --style=kr -s=4 *.c
```

* `-l`: 特点是括号从名称空间，类，函数定义处断开，但是在函数定义的内部，把括号加在语句的后面

```c
void foo(bool is_foo)
{
    if (is_foo) {
        bar();
    } else {
        another_bar();
    }

}
```

* `-f`: 增加空行，或后空格

```c
if_foo = true;
if(is_foo){
    bar();
}else{
    another_bar();
}

becomes:

if_foo = true;

if(is_foo) {
    bar();
}else {
    another_bar();
}
```

* `-F`: 对语句块的填充，这个包括上面的`-f`

```c
if_foo = true;
if(is_foo){
    bar();
}else{
    another_bar();
}

becomes:

if_foo = true;

if(is_foo) {
    bar();

}else {
    another_bar();
}
```

* `-p`: 对运算符前后增加空格

```c
if (foo==2)
    a=bar((b-c)*a,*d--);

becomes:

if (result == 2)
    a = bar((b - c) * a, *d--);
```

* `-H`: 仅仅对语句的头，例如if,while,for等进行填充空格

```c
if(is_foo(a, b))
    bar(a, b);

becomes:

if (is_foo(a, b))
    bar(a, b);
```

* `-U`: 对圆括号操作的逆操作

```c
if ( if_foo( a, b ) )
    bar ( a, b );

becomes:

if(if_foo(a, b))
    bar(a, b);
```

* `-x`: 删除多余的空行，注意函数或者方法外的空行不删除

* `-z2`: 使用linux版本的回车符

* `-j`:为`if/for/while`增加大括号，即使只有一天语句

```c
if (isFoo)
    isFoo = false;

becomes:
if (isFoo) {
    isFoo = false;

}
```

