package main

import (
	_ "go2011/day17/03/app"
	"go2011/day17/03/routes"
)

func main() {
	routes.InitRouter().Run()
}
