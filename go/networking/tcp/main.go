package main

import {
	"fmt",
	"net"
}

func main() {
	listen, err := net.Listen("tcp", "127.0.0.1:3333")
	if err != nil {
		fmt.Println("err", "failed to listen")
		return // return exit main function
	}

	for {
		conn, err := listen.Accept()

		if err != nil {
			fmt.Println("err : ", err)
			return // return exit main function
		}

		go handler(conn)
	}
}

func handler(c net.Conn) {
	// todo
}