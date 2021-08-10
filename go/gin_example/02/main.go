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

	v1 := r.Group("/v1")
	{ // 让代码更加规范
		// http://127.0.0.1:8080/index/shineyork?age=10
		v1.GET("/login/:name", login)
	}

	r.POST("/login", login2)

	// 默认端口是 8080
	r.Run()
}
func login(c *gin.Context) {
	name := c.Param("name")
	age := c.Query("age")
	// c.String(200, "hello gin and "+ name)
	c.JSON(200, gin.H{
		"code": "ok",
		"name": name,
		"age":  age,
	})
}

func login2(c *gin.Context) {
	c.String(200, "hello gin post")
}
