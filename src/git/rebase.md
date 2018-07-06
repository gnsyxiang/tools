rebase
======


## rebase功能介绍

## 案例

### 需求背景

将 A 功能从 branchA 合入到主分支 master 后过了很多个提交后，发现 A 功能某个地方有 bug，那最好的方法就是跳回到写 A 功能的时候进行修改。

这分为两个部分

* 修改之前某次的 commit 信息

* 修改之前某次的 commit 内容

### 实现方法

比如我现在的 git log 如下：

```
4fd65115db FUNCTION Mipi Camera Camera IC: OV13850 Interface: RX1
97a8ad0f7f FUNCTION 移植 8寸 Mipi LCD Driver IC: RM72014
9633cf0919 FUNCTION 移植 8寸 TP Driver IC:GT911
```

我现在发现当时移植 TP 的时候有 bug，我需要回到 9633cf0919 对进行 TP 进行移植的时候来修复这个 Bug。

我只需要这样做：

* 当前分支无关的工作状态进行暂存

```
git stash
```

* 将 HEAD 移动到需要修改的 commit 上

```
git rebase 9633cf0919^ --interactive
```

* 找到需要修改的 commit ，将首行的 pick 改成 edit

* 开始着手解决你的 bug

```
  git add 将改动文件添加到暂存
  git commit –amend 追加改动到提交
```

* git rebase –continue 移动 HEAD 回最新的 commit

* 恢复之前的工作状态

```
  git stash pop
```


