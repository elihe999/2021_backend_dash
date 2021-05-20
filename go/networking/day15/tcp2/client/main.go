package main

import (
	"bytes"
	"encoding/binary"
	"fmt"
	"net"
)

// tcp客户端
func main() {
	// 1. 创建建立连接
	conn, _ := net.Dial("tcp", "127.0.0.1:3333")
	fmt.Println("与tcp://127.0.0.1:3333建立连接")
	defer conn.Close()

	// int16 -> 2 个字节
	msg := "shineyork666" // 字节切片
	msgLen := len(msg)
	length := int16(msgLen) // 长度2个字节
	fmt.Println("length : ", length)
	fmt.Println("msgLen : ", msgLen)
	pkg := new(bytes.Buffer)
	binary.Write(pkg, binary.BigEndian, length)
	data := append(pkg.Bytes(), []byte(msg)...)
	fmt.Println("data : ", string(data))
	// 2. 进行数据的发送&接收数据
	conn.Write(data)
	var pack [1024]byte
	n, _ := conn.Read(pack[:])
	fmt.Println("n : ", string(pack[:n])) // 切片获取信息
	// 3. 关闭 // 不关闭不会造成太大 ，如果服务端没有心跳会存在问题
}
