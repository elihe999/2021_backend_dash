package main

import "github.com/gin-gonic/gin"

func main() {
	r := gin.Default()
	// http://127.0.0.1:8080/index
	r.GET("/index", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"code": "ok",
		})
	})
	// 默认端口是 8080
	r.Run()
}
