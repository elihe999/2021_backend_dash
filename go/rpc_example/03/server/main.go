package main

import (
	"fmt"
	"net"
	"net/rpc"
	"net/rpc/jsonrpc"
	"strconv"
)

type Goods struct {
	Id   int
	Name string
}
type Params struct {
	Id   int
	Name string
}

func (g *Goods) FindById(args *Params, reply *Goods) error {
	fmt.Println("接收到请求信息 ：", args)
	*reply = *g
	return nil
}

func (g *Goods) GetByIdGoodsName(args *Params, reply *string) error {
	fmt.Println("接收到请求信息 ：", args)
	*reply = "苹果 --》》 6666"
	return nil
}

const (
	SERVE_HOST = "127.0.0.1"
	SERVE_PORT = 9500
)

func init() {
	// 把服务注册到consul中
	registerConsul()
}

func main() {
	// 开启rpc监听 -》端口和ip
	listen, _ := net.Listen("tcp", SERVE_HOST+":"+strconv.Itoa(SERVE_PORT))
	defer listen.Close()
	// 建立连接
	conn, _ := listen.Accept()
	// 注册服务   =》》 hash表
	// RegisterName （name,recv）
	// （name 服务标识    recv 具体的服务
	rpc.RegisterName("goods", new(Goods))

	jsonrpc.ServeConn(conn)
}
