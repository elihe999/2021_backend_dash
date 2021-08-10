package routes

import "github.com/gin-gonic/gin"

// 约定自动注册的类型
type Router func(*gin.Engine)

// 记录自动注册的操作
// -> routers 采用 map =》 对对象做类似ioc
var routers = []Router{}

func RegisterRoute(routes ...Router) { // []
	routers = append(routers, routes...) // ... [] => routers
}

func InitRouter() *gin.Engine {
	r := gin.Default()

	for _, route := range routers {
		route(r) // 加载route
	}

	return r
}

// 规模 -》再增大
// func InitRouter() *gin.Engine {
// 	r := gin.Default()
// 	// http://127.0.0.1:8080/index
// 	r.GET("/index", func(c *gin.Context) {
// 		c.JSON(200, gin.H{
// 			"code": "ok",
// 		})
// 	})
// 	r.GET("/goods", app.GetGoods)
// 	// 默认端口是 8080
// 	return r
// }
