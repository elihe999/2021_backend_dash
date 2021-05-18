package main

import (
	"bufio"
	"fmt"
	"net"
)

func main() {
	fmt.Println("启动服务端 ： tcp://127.0.0.1:3333")
	// 1. 监听端口 tcp://0.0.0.0:3333  监听的网络主要以本机可用ip为主
	listen, err := net.Listen("tcp", "127.0.0.1:3333")
	if err != nil {
		fmt.Println("err : ", err)
		return // return 表示程序结束
	}
	for {
		// 2. 接收客户向服务端建立的连接
		conn, err := listen.Accept() // 可以与客户端建立连接 ， 如果没有连接挂起阻塞状态
		if err != nil {
			fmt.Println("err : ", err)
			return // return 表示程序结束
		}
		// 3. 处理用户的连接信息
		go handler(conn)
	}
}

// 处理用户的连接信息
func handler(c net.Conn) {
	defer c.Close() // 一定要写 ，关闭连接
	for {
		var data [1024]byte // 数组 - 》定义每一次数据读取的量
		//  Read(p []byte) 需要采用切片接收
		n, err := bufio.NewReader(c).Read(data[:])
		if err != nil {
			fmt.Println("err : ", err)
			break
		}
		fmt.Println("n", string(data[:n]))
		// Write(b []byte) (n int, err error)
		c.Write([]byte("hello world i'm is server"))
	}
}
