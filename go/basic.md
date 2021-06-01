# basic

## Ds

### array & slice

#### array

> var variable_name [SIZE] variable_type

```go
var balance [10] float32
```

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

#### 合并数组、切片

```go
package main
import "fmt"

func main() {
    var arr1 = []int{1,2,3}
    var arr2 = []int{4,5,6}
    var arr3 = []int{7,8,9}
    var s1 = append(append(arr1, arr2...), arr3...)
    fmt.Printf("s1: %v\n", s1)
}
```

> s1: [1 2 3 4 5 6 7 8 9]

#### 去除重复

*example 1*

> 定义一个新切片（数组），存放原数组的第一个元素，然后将新切片（数组）与原切片（数组）的元素一一对比，如果不同则存放在新切片（数组）中。

```go
package main

import "fmt"

func main() {
    var arr = []string{"hello", "hi", "world", "hi", "china", "hello", "hi"}
    fmt.Println(RemoveRepeatedElement(arr))
}


func RemoveRepeatedElement(arr []string) (newArr []string) {
    newArr = make([]string, 0)
    for i := 0; i < len(arr); i++ {
        repeat := false
        for j := i + 1; j < len(arr); j++ {
            if arr[i] == arr[j] {
                repeat = true
                break
            }
        }
        if !repeat {
            newArr = append(newArr, arr[i])
        }
    }
    return
}
```

*example 2*

> 先将原切片（数组）进行排序，在将相邻的元素进行比较，如果不同则存放在新切片（数组）中。

```go
package main

import "fmt"

func main() {
    var arr = []string{"hello", "hi", "world", "hi", "china", "hello", "hi"}
    fmt.Println(RemoveRepeatedElement(arr))
}

func RemoveRepeatedElement(arr []string) (newArr []string) {
    newArr = make([]string, 0)
    sort.Strings(arr)
    for i := 0; i < len(arr); i++ {
        repeat := false
        for j := i + 1; j < len(arr); j++ {
            if arr[i] == arr[j] {
                repeat = true
                break
            }
        }
        if !repeat {
            newArr = append(newArr, arr[i])
        }
    }
    return
}
```

```go
for i:=0;i&lt;len(arr)-1;i++ {
    j = i+1
    if arr[i] == arr[j] { continue }
    rs = append(rs, arr[i])
    if j == len(arr)-1 { rs =append(rs, arr[j]) }
}
```

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

#### 格式化

##### sprintf

```go
package main

import (
    "fmt"
)

func main() {
   // %d 表示整型数字，%s 表示字符串
    var stockcode=123
    var enddate="2020-12-31"
    var url="Code=%d&endDate=%s"
    var target_url=fmt.Sprintf(url,stockcode,enddate)
    fmt.Println(target_url)
}
```

##### Print Println
>Print:   输出到控制台(不接受任何格式化，它等价于对每一个操作数都应用 %v)
         fmt.Print(str)


> Println: 输出到控制台并换行
         fmt.Println(tmp)
Printf : 只可以打印出格式化的字符串。只可以直接输出字符串类型的变量（不可以输出整形变量和整形 等）
         fmt.Printf("%d",a)
Sprintf：格式化并返回一个字符串而不带任何输出。
         s := fmt.Sprintf("a %s", "string") fmt.Printf(s)
Fprintf：来格式化并输出到 io.Writers 而不是 os.Stdout。
         fmt.Fprintf(os.Stderr, “an %s\n”, “error”)
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

## Json

### Json解析到结构体

*example 1*
```go
package main
import (
    "encoding/json"
    "fmt"
    "os"
)
type Server struct {
    ServerName string
    ServerIP   string
}
type Serverslice struct {
    Servers []Server
}
func main() {
    var s Serverslice
    str := `{"servers":
   [{"serverName":"Guangzhou_Base","serverIP":"127.0.0.1"},
   {"serverName":"Beijing_Base","serverIP":"127.0.0.2"}]}`
    err:=json.Unmarshal([]byte(str), &s)
    if err!=nil{
        fmt.Println(err)
    }
    fmt.Println(s)
    fmt.Println(s.Servers[0].ServerName)
}
```

*example 2*
```go
package main

import (
    "encoding/json"
    "fmt"
    "github.com/bitly/go-simplejson"
)

type personInfo struct {
    Name  string `json:"name"`
    Age   int    `json:"age"`
    Email string `json:"email" xml:"email"`
}

type personInfo1 struct {
    Name  string `json:"name"`
    Email string `json:"email" xml:"email"`
    C     string
}

func main() {
    // 创建数据
    p := personInfo{Name: "Piao", Age: 10, Email: "piaoyunsoft@163.com"}

    // 序列化
    data, _ := json.Marshal(&p)
    fmt.Println(string(data))

    // 反序列化
    var p1 personInfo1
    err := json.Unmarshal([]byte(data), &p1) // 貌似这种解析方法需要提前知道 json 结构
    if err != nil {
        fmt.Println("err: ", err)
    } else {
        fmt.Printf("name=%s, c=%s, email=%s\n", p1.Name, p1.C, p1.Email)
    }
    fmt.Printf("%+v\n", p1)

    // 反序列化
    res, err := simplejson.NewJson([]byte(data))
    if err != nil {
        fmt.Println("err: ", err)
    } else {
        fmt.Printf("%+v\n", res)
    }
}
```

## file

```go
func ReadAll(filePth string) ([]byte, error) {
 f, err := os.Open(filePth)
 if err != nil {
  return nil, err
 }
 

 return ioutil.ReadAll(f)
}
```

```go
package main
 import (

 "bufio"
 "io"
 "os"
)

func processBlock(line []byte) {
 os.Stdout.Write(line)
}

func ReadBlock(filePth string, bufSize int, hookfn func([]byte)) error {
 f, err := os.Open(filePth)
 if err != nil {
  return err
 }
 defer f.Close()

 buf := make([]byte, bufSize) //一次读取多少个字节
 bfRd := bufio.NewReader(f)
 for {
  n, err := bfRd.Read(buf)
  hookfn(buf[:n]) // n 是成功读取字节数

  if err != nil { //遇到任何错误立即返回，并忽略 EOF 错误信息
   if err == io.EOF {
    return nil
   }
   return err
  }
 }

 return nil
}

func main() {
 ReadBlock("test.txt", 10000, processBlock)
}
```


### 逐行读取

```go
package main
 

import (
 "bufio"
 "io"
 "os"
)

func processLine(line []byte) {
 os.Stdout.Write(line)
}

func ReadLine(filePth string, hookfn func([]byte)) error {
 f, err := os.Open(filePth)
 if err != nil {
  return err
 }
 defer f.Close()

 bfRd := bufio.NewReader(f)
 for {
  line, err := bfRd.ReadBytes('\n')
  hookfn(line) //放在错误处理前面，即使发生错误，也会处理已经读取到的数据。
  if err != nil { //遇到任何错误立即返回，并忽略 EOF 错误信息
   if err == io.EOF {
    return nil
   }
   return err
  }
 }
 return nil
}

func main() {
 ReadLine("test.txt", processLine)
}
```
