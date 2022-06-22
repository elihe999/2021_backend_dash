package main

import (
	"fmt"
	"os"
)
func add(num int) {
	num += 1
}

func realAdd(num *int) {
	*num += 1
}

func main() {
	num := 100
	add(num)
	fmt.Println(num)  // 100，num 没有变化

	realAdd(&num)
	fmt.Println(num)  // 101，指针传递，num 被修改

	var arr [5]int
	var arr2 [5][5]int
	for i := 0; i < len(arr); i++ {
		arr[i] += 100
	}
	fmt.Println(arr)
	fmt.Println(arr2)

	_, err := os.Open("file.txt")
	if err != nil {
		fmt.Println(err)
	}
}
