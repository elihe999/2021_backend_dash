package main

import (
	"fmt"
	pb "go2012/day20/06/proto/goods" // 引入编译生成的包

	"golang.org/x/net/context"
	"google.golang.org/grpc"
	"google.golang.org/grpc/grpclog"
)

const (
	// Address gRPC服务地址
	Address = "127.0.0.1:1234"
)

func main() {
	// 连接
	conn, err := grpc.Dial(Address, grpc.WithInsecure())
	if err != nil {
		grpclog.Fatalln(err)
	}
	defer conn.Close()

	// 初始化客户端
	c := pb.NewGoodsServiceClient(conn)

	// 调用方法
	req := &pb.Goods{}
	res, err := c.Get(context.Background(), req)

	if err != nil {
		grpclog.Fatalln(err)
	}

	// grpclog.Println(res.Message)
	fmt.Println(res)
}
