package controllers

import (
	beego "github.com/beego/beego/v2/server/web"
)

type HelloController struct {
	beego.Controller
}

func (c *HelloController) Get() { // 接收get类型的请求

	// 相应信息
	c.Ctx.WriteString("shineyork666!")
}
func (c *HelloController) Post() { // 接收post类型的请求

}
