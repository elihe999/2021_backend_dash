package main

import (
	"fmt"
	"sync"
	"time"
)

var wg sync.WaitGroup

var sendChOnly chan<- string // 单向发送通道
var recvChOnly <-chan string // 单向获取通道

// main => 协程
// main 结束之后内部所有的协程都是不会再运行
// 协程切换条件？ 阻塞
func main() {

	go B()
	go C()
	go A()
	//
	// time.Sleep(time.Second)
	
	time.Sleep(time.Second)
}

func sendfChOnly(ch chan<- string) {
	ch <- "shineyork" //
}

func recvfChOnly(ch <-chan string) {
	fmt.Println("接收通道信息", <-ch)
}

func recv(ch chan string) {
	fmt.Println("接收通道信息", <-ch)
}

func send1(ch chan string) { // 通道参数引用
	ch <- "shineyork" //
	fmt.Println("1  ")
	ch <- "sixstar" // 因为通道满了 =》阻塞
	fmt.Println("2  ")
	ch <- "go"
	fmt.Println("3  ")
}

func recv1(ch chan string) { // 通道参数引用
	s := <-ch
	fmt.Println(" s : ", s)
	fmt.Println("接收通道信息", <-ch) // 通道没有数据？取不出 =》 阻塞

	if <-ch == "go" {
		fmt.Println("go")
	}
}

func A() {
	fmt.Println("A")
}
func B() {
	fmt.Println("B")
}
func C() {
	fmt.Println("C")
}

/*
go func main(){
  go func() {
    fmt.Println("k")
  }()

  go func() {
    fmt.Println("ko")
  }()
}
*/
