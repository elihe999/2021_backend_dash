package main

import (
	_ "03/app"
	"03/routes"
)

func main() {
	routes.InitRouter().Run()
}
