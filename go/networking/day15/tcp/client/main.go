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
	conn, _ := net.Dial("tcp", "127.0.0.1:9503")
	fmt.Println("与tcp://127.0.0.1:3333建立连接")
	defer conn.Close()

	msg := "shineyork666"   // => byte[]
	msgLen := len(msg)      // int => int16
	length := int16(msgLen) // 16 位 int16=》占 2 个字节
	fmt.Println("msgLen : ", msgLen)
	fmt.Println("length : ", length)
	pkg := new(bytes.Buffer) // 是因为
	// 把 length => 二进制转化 =》 放到 pkg
	// io.Writer
	binary.Write(pkg, binary.BigEndian, length)
	// pkg.Bytes() => 进制转化后的具体数据 ，append 方法追加msg数据前
	data := append(pkg.Bytes(), []byte(msg)...) // append()
	fmt.Println("data : ", data)
	conn.Write(data)
	// 2. 进行数据的发送&接收数据
	// for i := 0; i < 20; i++ {
	// 	conn.Write([]byte("你好 server"))
	// }
	// var data [1024]byte
	// n, _ := conn.Read(data[:])
	// fmt.Println("n : ", string(data[:n])) // 切片获取信息
	// 3. 关闭 // 不关闭不会造成太大 ，如果服务端没有心跳会存在问题
}
