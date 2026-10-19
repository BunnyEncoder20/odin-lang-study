package main
import "core:fmt"
fibonacci :: proc(n: int) -> int {
	switch n {
	case 0:
		return 0
	case 1:
		return 1
	}
	return fibonacci(n - 1) + fibonacci(n - 2)
}

main :: proc() {
	fmt.printfln("Ans: %d", fibonacci(10))
}
