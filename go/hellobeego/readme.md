# guide

## controller

```go
package controllers
import (
        "github.com/astaxie/beego"
)
type MainController struct {
        beego.Controller
}
func (this *MainController) Get() {
        this.Data["Website"] = "beego.me"
        this.Data["Email"] = "astaxie@gmail.com"
        this.TplName = "index.tpl"
}
```

### 参数配置

beego 目前支持 INI、XML、JSON、YAML 格式的配置文件解析，但是默认采用了 INI 格式解析，用户可以通过简单的配置就可以获得很大的灵活性。

#### 默认配置解析

beego 默认会解析当前应用下的 conf/app.conf 文件。

通过这个文件你可以初始化很多 beego 的默认参数：
```ini
appname = beepkg
httpaddr = "127.0.0.1"
httpport = 9090
runmode ="dev"
autorender = false
recoverpanic = false
viewspath = "myview"
```

## Bee

下面为 windows 下的快捷操作批处理文件：
在 %GOPATH%/src 目录下分别创建文件 step1.install-bee.bat 和 step2.new-beego-app.bat。

step1.install-bee.bat 文件内容：
```bat
set GOPATH=%~dp0..
go build github.com\beego\bee
copy bee.exe %GOPATH%\bin\bee.exe
del bee.exe
pause
```

### Install

beego 包含一些示例应用程序以帮您学习并使用 beego 应用框架。

您需要安装 Go 1.1+ 以确保所有功能的正常使用。

你需要安装或者升级 Beego 和 Bee 的开发工具:

$ go get -u github.com/beego/beego/v2
$ go get -u github.com/beego/bee/v2

### Pack

> bee pack
```cmd
app path: /gopath/src/apiproject
GOOS darwin GOARCH amd64
build apiproject
build success
exclude prefix:
exclude suffix: .go:.DS_Store:.tmp
file write to `/gopath/src/apiproject/apiproject.tar.gz`
```


### Beego Structure

#### Beego routers

--routers


#### views


### Beego module

#### config

go get github.com/astaxie/beego/config


## orm

app.conf

- appname
- httpport
- runmode

orm mysql

## Issue

