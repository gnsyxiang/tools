readme
======

## 编译源码的步骤:

#### 下载源码

```
     $ ./download-git-src.sh
```

#### 编译源码

```
     $ make
```

#### 安装

* 生成的文件都在`install/htop`下面，把他们对应放到`/usr/`下即可  

```
  $ adb push htop /usr/
```

* 增加环境变量  

```
  $ vi /etc/profile
    export TERM=vt102
    export TERMINFO=/usr/share/terminfo
```





