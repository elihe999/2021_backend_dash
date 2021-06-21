package main

import (
	"bufio"
	"bytes"
	"encoding/binary"
	"fmt"
	"net"
	"time"
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
	reader := bufio.NewReader(c)
	for {
		// 接收
		// var data [1024]byte // 数组 - 》定义每一次数据读取的量
		// n, err := bufio.NewReader(c).Read(data[:])
		msg, err := unpack(reader)
		if err != nil {
			fmt.Println("err : ", err)
			break
		}
		fmt.Println("n", msg)
		time.Sleep(2e9)

		// 发送信息
		c.Write([]byte("hello world i'm is server")) // 向客户端发送的时候也需要做粘包处理
	}
}

// 数据解析
func unpack(reader *bufio.Reader) (string, error) {
	lenByte, _ := reader.Peek(2) // 读取前 2 个字节的数据
	lengthBuff := bytes.NewBuffer(lenByte)
	var length int16
	err := binary.Read(lengthBuff, binary.BigEndian, &length)
	if err != nil {
		fmt.Println("err :", err)
	}
	fmt.Println("length : ", length)
	// 判断
	// 2 + 数据长度 ；length = 数据长度 + 2
	// 包头 + 数据
	if int16(reader.Buffered()) < length+2 {
		return "", err
	}
	// 读取数据
	pack := make([]byte, int(length+2))
	_, err = reader.Read(pack)
	if err != nil {
		return "", err
	}
	return string(pack[2:]), nil
}

//
