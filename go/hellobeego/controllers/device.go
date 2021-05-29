package controllers

import (
	"github.com/beego/beego/v2/server/web"
)

type DeviceController struct {
	web.Controller
}

func (this *DeviceController) Get() {
	this.Data["Website"] = "beego.me"
	this.Data["Email"] = "astaxie@gmail.com"
	this.TplName = "device/index.tpl"
	this.Render()
}

func (this *MainController) GetDeviceInfo() {
	id := this.Ctx.Input.Param(Key:":id")
	this.Ctx.WriteString("getInfo dat, id = "+id)
}