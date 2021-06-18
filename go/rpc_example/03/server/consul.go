package main

import "shineyork/consul"

const (
	CONSUL_HOST = "192.168.169.204"
	CONSUL_PORT = 8500
)

var serverConfig map[string]interface{} = map[string]interface{}{
	"ID":      "go_day20",
	"Name":    "go_day20_1",
	"Address": SERVE_HOST,
	"Port":    SERVE_PORT,
}

func registerConsul() error {
	agent := consul.NewAgent(CONSUL_HOST, CONSUL_PORT)
	_, err := agent.RegisterService(serverConfig)
	if err != nil {
		return err
	}
	return nil
}
