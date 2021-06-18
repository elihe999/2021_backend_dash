package main

import (
	"encoding/json"
	"fmt"
	"net/rpc/jsonrpc"
	"shineyork/consul"
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

const (
	CONSUL_HOST = "192.168.169.204"
	CONSUL_PORT = 8500
)

func main() {
	servers := getServer()
	// fmt.Println("servers : ", servers)
	conn, _ := jsonrpc.Dial("tcp", servers["go_day20"]["Address"].(string)+":"+strconv.Itoa(int(servers["go_day20"]["Port"].(float64))))
	defer conn.Close()
	var data string
	err := conn.Call("goods.GetByIdGoodsName", Params{}, &data)
	if err != nil {
		fmt.Println("err : ", err)
	}
	fmt.Println("data : ", data)
}

// {
// 		-"go_day20": {
// 				"ID": "go_day20",
// 				"Service": "go_day20_1",
// 				"Tags": [ ],
// 				"Meta": { },
// 				"Port": 9500,
// 				"Address": "127.0.0.1",
// 				-"Weights": {
// 						"Passing": 1,
// 						"Warning": 1
// 				},
// 				"EnableTagOverride": false
// 		}
// }
func getServer() (server map[string]map[string]interface{}) {
	res, err := consul.NewAgent(CONSUL_HOST, CONSUL_PORT).Services()
	if err != nil {
		fmt.Println("consul err : ", err)
		return nil
	}

	if err := json.Unmarshal(res.Body, &server); err == nil {
		return server
	} else {
		fmt.Println("json err : ", err)
		return nil
	}
}
