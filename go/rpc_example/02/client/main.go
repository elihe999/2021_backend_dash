package main

import (
	"fmt"
	"net/rpc/jsonrpc"
)

type Goods struct {
	Id   int
	Name string
}

type Params struct {
	Id   int
	Name string
}

func main() {
	conn, _ := jsonrpc.Dial("tcp", "127.0.0.1:9500")
	defer conn.Close()
	var data string
	err := conn.Call("goods.GetByIdGoodsName", Params{}, &data)
	if err != nil {
		fmt.Println("err : ", err)
	}
	fmt.Println("data : ", data)
}
