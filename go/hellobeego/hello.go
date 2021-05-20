// package main

// import "github.com/beego/beego/v2/server/web"

// func main() {
// 	web.Run()
// }

package main

import (
	"os/exec"
	"runtime"

	"github.com/beego/beego/v2/server/web"
)

func openBrowser(url string) error {
	var cmd string
	var args []string
	switch runtime.GOOS {
	case "windows":
		cmd = "cmd"
		args = []string{"/c", "start"}
	case "darwin":
		cmd = "open"
	default: // "linux", "freebsd", "openbsd", "netbsd"
		cmd = "xdg-open"
	}
	return exec.Command(cmd, append(args, url)...).Start()
}

type MainController struct {
	web.Controller
}

func (this *MainController) Get() {
	this.Ctx.WriteString("hello world")
}

func main() {
	openBrowser("http://localhost:8080")
	web.Router("/", &MainController{})
	web.Run()
}
