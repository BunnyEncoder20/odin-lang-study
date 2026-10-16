package main
import "core:fmt"

main :: proc() {
	switch cpu_arch := ODIN_ARCH; cpu_arch {
	case .i386, .wasm32, .arm32:
		fmt.println("32 bit")
	case .amd64, .wasm64p32, .arm64, .riscv64:
		fmt.println("64 bit")
	case .Unknown:
		fmt.println("Unknow Architecture")
	}

	// switch statement without the is the same as switch true.
	// This can be used to write a clean and long if-else chain and have the ability to break if needed
	x := -5
	switch {
	case x < 0:
		fmt.println("x is negative")
	case x == 0:
		fmt.println("x is zero")
	case:
		fmt.println("x is positive")
	}

	// switch can also use ranges like a range-base loop:
	c := '9'
	switch c {
	case 'A' ..= 'Z', 'a' ..= 'z', '0' ..= '9':
		fmt.println("c is alphanumeric")
	}

	age: int = 1
	switch age {
	case 0 ..< 10:
		fmt.println("baby")
	case 10 ..< 13:
		fmt.println("preteen")
	case 13 ..< 18:
		fmt.println("teenager")
	case 18 ..< 25:
		fmt.println("Young Adult")
	case 25 ..< max(int):
		fmt.println("Adult")
	case:
		fmt.println("Invalid age")
	}
}
