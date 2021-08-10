package goods

import (
	"03/routes"

	"github.com/gin-gonic/gin"
)

func init() { // 初始化的时候注册
	routes.RegisterRoute(Routes)
}

func Routes(g *gin.Engine) { // func(*gin.Engine)
	// g.GET

	g.GET("/getGoods", GetGoods)
}
