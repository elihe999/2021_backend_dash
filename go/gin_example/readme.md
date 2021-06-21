# gin

## Install

```go
go get -u github.com/gin-gonic/gin
```

## Hello World

```go
package main
import ( "net/http" "github.com/gin-gonic/gin" )
func main() {
    // 1.创建路由
    r := gin.Default()
    // 2.绑定路由规则，执行的函数
    // gin.Context，封装了request和response
    r.GET("/", func(c *gin.Context) {
        c.String(http.StatusOK, "hello World!")
    })
    // 3.监听端口，默认在8080
    // Run("里面不指定端口号默认为8080")
    r.Run(":8000")
}
```

## Arch

### Route

```go
// group routes 分组路由
defaultHandler := func(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{
		"path": c.FullPath(),
	})
}
// group: v1
v1 := r.Group("/v1")
{
	v1.GET("/posts", defaultHandler)
	v1.GET("/series", defaultHandler)
}
// group: v2
v2 := r.Group("/v2")
{
	v2.GET("/posts", defaultHandler)
	v2.GET("/series", defaultHandler)
}
```
#### auto load

03
```go
func InitRouter() *gin.Engine {
	r := gin.Default()
	// http://127.0.0.1:8080/index
	r.GET("/index", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"code": "ok",
		})
	})
	r.GET("/goods", app.GetGoods)
	// 默认端口是 8080
	return r
}
```

> 方法2

```go
type Router func(*gin.Engine)
var routers = []Router{}

func RegisterRoute(routes ...Router) { // []
	routers = append(routers, routes...) // ... [] => routers切片...
}

func InitRouter() *gin.Engine {
	r := gin.Default()

	for _, route := range routers {
		route(r) // 加载route
	}

	return r
}
```

加载route route()

```go
package order

import (
	"go2011/day17/03/routes"

	"github.com/gin-gonic/gin"
)

func init() { // 初始化的时候注册
	routes.RegisterRoute(Routes)
}

func Routes(g *gin.Engine) {
	// g.GET
	g.GET("/getorder", GetOrder)
}
```

## Issue

> ?Package xxx is not in GOROOT

```go
go mod init
go mod vendor
```

> ?Can not find package .

> go.mod

```go
module 03   // Here is the prefix you entry on 'go mod init'

go 1.16

require github.com/gin-gonic/gin v1.7.2
```