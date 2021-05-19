package main

import (
	"fmt"
)

type Goods struct {
	Id int,
	Name string
}

func add_number(x,y int) (z int) {
	z = x + y
	return z
}

func main() {
	a := add_number(1,2)
	fmt.Println(a)
}