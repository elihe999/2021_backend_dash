package main

import (
	"fmt"
	"net/http"
)

func main() {
	// http.Handle("/foo", fooHandler)
	fmt.Println("启动http://127.0.0.1:8888")
	// http://127.0.0.1:8888/bar
	http.HandleFunc("/bar", fooHandler) // route
	// http.ListenAndServeTLS("") // https
	http.ListenAndServe(":8888", nil) // http
}

// 要求传递的方法的类型  func(http.ResponseWriter, *http.Request)
// fooHandler(w http.ResponseWriter, r *http.Request)
func fooHandler(w http.ResponseWriter, r *http.Request) {
	// 处理逻辑事项的方法
	fmt.Println("处理逻辑")
	fmt.Println("得到连接", r.RemoteAddr)
	fmt.Println("url", r.URL.Path)
	fmt.Println("method", r.Method)

	w.Write([]byte("666"))
}
