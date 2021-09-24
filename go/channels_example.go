type worker struct {
    in chan int
    done chan bool
}
 
func chanDemo1(){
    var workers [10]worker
 
    for i := 0; i < 10; i++ {
        workers[i] = createWorker1(i)
    }
 
    for i := 0; i < 10; i++ {
        workers[i].in <- 'a' + i
        <- workers[i].done
    }
 
    for i := 0; i < 10; i++ {
        workers[i].in <- 'A' + i
        <- workers[i].done
    }
 
}
 
func createWorker1(id int) worker {
    work := worker{
        in: make(chan int),
        done: make(chan bool),
    }
    go func() {
        for {
            fmt.Printf("Work %d receiverd %c\n", id, <- work.in)
            work.done <- true
        }
    }()
    return  work
}
 
 
func main(){
    chanDemo1()
    fmt.Println("over")
}
