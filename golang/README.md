# GOLANG

## Context

* 基础
* 包
* 协程
* 网络
* beego
* gin
* mirco server
* rpc
* protobuf
* K8s docker

## Basic

### array

*声明数组*
> var variable_name [SIZE] variable_type

*初始化数组*

> var balance = [5]float32{1000.0, 2.0, 3.4, 7.0, 50.0}
balance := [5]float32{1000.0, 2.0, 3.4, 7.0, 50.0}
>> 如果数组长度不确定，可以使用 ... 代替数组的长度，编译器会根据元素个数自行推断数组的长度：
var balance = [...]float32{1000.0, 2.0, 3.4, 7.0, 50.0}
或
balance := [...]float32{1000.0, 2.0, 3.4, 7.0, 50.0}

> 如果设置了数组的长度，我们还可以通过指定下标来初始化元素：
//  将索引为 1 和 3 的元素初始化
balance := [5]float32{1:2.0,3:7.0}

### String

```go
var str = "string"
```

```go
const str = `第一行
第二行
第三行
\r\n
`
```

#### len

```go
tip1 := "genji is a ninja"
fmt.Println(len(tip1))
tip2 := "忍者"
fmt.Println(len(tip2))
```

 > RuneCountInString()
fmt.Println(utf8.RuneCountInString("忍者"))

* 总结
ASCII 字符串长度使用 len() 函数。
Unicode 字符串长度使用 utf8.RuneCountInString() 函数。

#### example

```go
package main

import (
    "fmt"
    "strconv"
    "strings"
)

// 字符串反转
func ReverseStr(str string) string {
    var result string
    strLen := len(str)
    for i := 0; i < strLen; i++ {
        result = result + fmt.Sprintf("%c", str[strLen-i-1])
    }
    return result
}

func main() {
    var str1 = "Hello World"
    // 测量字符串长度
    result1 := len(str1)
    fmt.Println(result1) // 11

    // 字符串反转
    fmt.Println(ReverseStr(str1)) // dlroW olleH

    // 判断字符串s是否以prefix开头
    // func HasPrefix(s, prefix string) bool
    fmt.Println(strings.HasPrefix(str1, "H")) // true

    // 判断字符串s是否以suffix结尾
    // func HasSuffix(s, suffix string) bool
    fmt.Println(strings.HasSuffix(str1, "ld")) // true

    // 返回字符串在s中第一个substr实例的索引，如果s中不存在substr，则返回-1
    // func Index(s, substr string) int
    fmt.Println(strings.Index("chicken", "en")) // 5
    fmt.Println(strings.Index("chicken", "gg")) // -1

    // 返回字符串在s中最后一个substr实例的索引，如果s中不存在substr，则返回-1
    //func LastIndex(s, substr string) int
    fmt.Println(strings.Index("go gopher", "go")) // 0
    fmt.Println(strings.LastIndex("go gopher", "go")) // 3
    fmt.Println(strings.LastIndex("go gopher", "rodent")) // -1

    // 字符串替换
    // func Replace(s, old, new string, n int) string
    /*
    返回字符串s的副本，其中前n个非重叠的old实例替换为new。
    如果old为空，则它在字符串的开头和每个UTF-8序列之后匹配，对k-rune字符串产生最多k + 1个替换。
    如果n <0，则替换次数没有限制。
    */
    fmt.Println(strings.Replace("oink oink oink", "k", "pd", 2)) // oinpd oinpd oink
    fmt.Println(strings.Replace("oink oink oink", "oink", "pd", -1)) // pd pd pd

    // 计算字符串中某个字符出现次数
    // func Count(s, substr string) int
    /*
    计算字符串s中非重叠substr实例的数量。
    如果substr是空字符串，则Count返回1 + s中的Unicode代码点数。
    */
    fmt.Println(strings.Count("cheese", "e")) // 3
    fmt.Println(strings.Count("fw", "")) // 3

    // 拼接字符串本身
    // func Repeat(s string, count int) string
    fmt.Println(strings.Repeat("pd", 2)) // pdpd

    // 字符串全小写
    // func ToLower(s string) string
    fmt.Println(strings.ToLower("Gopher")) // gopher

    // 字符串全小大写
    // func ToUpper(s string) string
    fmt.Println(strings.ToUpper("Gopher")) // GOPHER

    // 去掉字符串首尾空白字符
    //func TrimSpace(s string) string
    fmt.Println(strings.TrimSpace(" \t\n Hello, World \n\t\r\n")) // Hello, World

    //去掉字符串首尾cutset字符
    // func Trim(s string, cutset string) string
    fmt.Println(strings.Trim("¡¡¡Hello!¡World!!!", "!¡")) // Hello!¡World

    // 去掉字符串首部cutset字符
    //func TrimLeft(s string, cutset string) string
    fmt.Println(strings.TrimLeft("¡¡¡Hello!¡World!!!", "!¡")) // Hello!¡World!!!

    // 去掉字符串尾部cutset字符
    // func TrimRight(s string, cutset string) string
    fmt.Println(strings.TrimRight("¡¡¡Hello!¡World!!!", "!¡")) // ¡¡¡Hello!¡World

    // 返回字符串空格分隔的所有子字符串片段
    // func Fields(s string) []string
    fmt.Println(strings.Fields("  foo bar  baz   ")) // [foo bar baz]

    // 返回字符串split分隔的所有子串的slice
    // func Split(s, sep string) []string
    fmt.Printf("%q\n", strings.Split("foo,bar,baz", ",")) // ["foo" "bar" "baz"]
    fmt.Printf("%q\n", strings.Split("a foo a bar a baz", "a ")) // ["" "foo " "bar " "baz"]
    fmt.Printf("%q\n", strings.Split(" xyz ", "")) // [" " "x" "y" "z" " "]
    fmt.Printf("%q\n", strings.Split("", "pd")) // [""]

    // 用sep把s中的所有元素连接起来，以创建单个字符串
    // func Join(a []string, sep string) string
    s := []string{"foo", "bar", "baz"}
    fmt.Printf("%q\n", strings.Join(s, ", ")) // "foo, bar, baz"

    // 把一个整数i转成字符串
    //func Itoa（i int）string
    i := 10
    str2 := strconv.Itoa(i)
    fmt.Printf("%T %q\n", str2, str2) // string "10"

    // 把一个字符串转成整数
    //func Atoi（s string）（int，error）
    str3 := "10"
    if s, err := strconv.Atoi(str3); err == nil {
        fmt.Printf("%T %d\n", s, s) // int 10
    }
}
```

### 协程

并发与网络编程
