package main

import
(
    "time"
)

var quit chan int = make(chan int)

func loop(ch chan int) {
    select {
		case <-ch:
		case <-time.After(time.Duration(20)*time.Second): quit <-0
	}
}

func gofor(ch chan int){
    for{ 
        _,ok:= <-ch;
        if ok {
            break
        }
    }
}

func main () {
    ch := make(chan int)
    /*
 24     close(ch)
 25     loop(ch)
 26     <-quit
 */ 
    go gofor(ch)
	time.Sleep(10*time.Second)
    ch<-0
}