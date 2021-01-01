package main

import "C"

func fibonacci(n uint) uint {
    if n <= 1 {
        return n
    }
    return fibonacci(n-1) + fibonacci(n-2)
}

func main(){}

