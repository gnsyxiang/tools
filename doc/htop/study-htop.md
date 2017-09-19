study-htop
==========

## introduce


## download the source

```
   $ git clone https://github.com/mirror/ncurses.git
   $ git clone https://github.com/hishamhm/htop.git
```

## compile

> note: refer to the Makefile file


## problem

### htop编译缺少依赖库和头文件

* 运行htop的configure是出现如下问题

```
  checking ncurses.h usability... no
  checking ncurses.h presence... no
  checking for ncurses.h... no
  configure: error: missing libraries:  libncurses
```

* 原因  
  没有找到ncurses的头文件和库文件

* 解决  
  在configure中加入如下配置

  ```
  LDFLAGS=-L$(PREFIX)/lib \
  CPPFLAGS=-I$(PREFIX)/include
  ```


### 缺少terminfo环境变量

* 运行htop出现如下问题

```
  / # htop
  Error opening terminal: vt102.
  / #
```

* 查看以下两个变量

```
  $ echo $TERM
  $ echo $TERMINFO
```

* 增加环境变量

```
  $ vi /etc/profile
  export TERM=vt102
  export TERMINFO=/usr/share/terminfo
```

> note: 确保在/usr/share/terminfo/v/下，存在vt102这个文件

## use skills







