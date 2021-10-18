package main

import (
	"fmt"
	"time"
)

func main() {
	fmt.Println("from main repo! with v1.1.2-alpha.1")
	fmt.Println("Current local time:")
	now := time.Now()
	fmt.Println(now)
}
