# day 14

Go语言的 defer 语句会将其后面跟随的语句进行延迟处理，在 defer 归属的函数即将返回时，将延迟处理的语句按 defer 的逆序进行执行，也就是说，先被 defer 的语句最后被执行，最后被 defer 的语句，最先被执行。

关键字 defer 的用法类似于面向对象编程语言 Java 和 C# 的 finally 语句块，它一般用于释放某些已分配的资源，典型的例子就是对一个互斥解锁，或者关闭一个文件。

## defer

```go

package main
import (
    "fmt"
)
func main() {
    fmt.Println("defer begin")
    // 将defer放入延迟调用栈
    defer fmt.Println(1)
    defer fmt.Println(2)
    // 最后一个放入, 位于栈顶, 最先调用
    defer fmt.Println(3)
    fmt.Println("defer end")
}

```

```
defer begin
defer end
3
2
1
```

## networking

* http

Golang 没有CRL (C++). pkgdoc

## 切片

```go
slice[i:]  // 从 i 切到最尾部
slice[:j]  // 从最开头切到 j(不包含 j)
slice[:]   // 从头切到尾，等价于复制整个 slice
// example
slice[i:j]
slice[i:j:k]
// 其中 i 表示从 slice 的第几个元素开始切，j 控制切片的长度(j-i)，k 控制切片的容量(k-i)，如果没有给定 k，则表示切到底层数组的最尾部。下面是几种常见的简写形式：
```