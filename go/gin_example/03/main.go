package main

import (
	_ "go/gin_example/03/app"
	"go/gin_example/03/routes"
)

func main() {
	routes.InitRouter().Run()
}
