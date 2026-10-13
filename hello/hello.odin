package main
import "core:fmt"

main :: proc() {
	fmt.println("Hello World")

	// assignment
	x: int = 2
	y: int = 3
	fmt.println(x + y)

	// Function calling
	fmt.println(multiply(x, y))
	str("bunny")
}

// Functions are called procedures
multiply :: proc(x: int, y: int) -> int {
	return x * y
}

// This is computed at compile time: hence not really a variable
str :: proc($name: string) {
	fmt.println("Length of the string is: ", len(name))
	greeting :: "Greetings, "
	fmt.println(greeting + name)
}

str2 :: proc(name: string) {
	fmt.println("This is a variable string's (not pre-computed at compile time) length", len(name))
	fmt.println("Congrats ", name)
}
