package main

import (
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/gin-gonic/gin/binding"
	"github.com/go-playground/validator"
)

// 根据请求发送的json的数据解析 =》 rpc通信
type Goods struct {
	Id         int
	GoodsName  string `form:"name" json:"name" binding:"required"`
	GoodsPrice int    `form:"price" json:"price" binding:"required,goodsChackPrice"` // GoodsPrice > 10
	GoodsNum   int    `form:"num" json:"num" binding:"required,gt=5"`
}

// 定义自定义验证器
var goodsChackPrice validator.Func = func(fl validator.FieldLevel) bool {
	fmt.Println("fl ===>>>> start ====>> ")
	field, _ := fl.Field().Interface().(int) // 是根据验证的字段进行定义
	fmt.Println("field : ", field)
	// 自定义的验证规则

	return true
}

func main() {
	r := gin.Default()

	if v, ok := binding.Validator.Engine().(*validator.Validate); ok {
		v.RegisterValidation("goodsChackPrice", goodsChackPrice)
	}

	r.POST("/goods", func(c *gin.Context) {
		var json Goods
		if err := c.ShouldBind(&json); err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
			return
		}

		fmt.Println("json ；", json)

		c.JSON(200, gin.H{
			"code":  "ok",
			"goods": json,
		})
	})
	// 默认端口是 8080
	r.Run()
}
