#+feature dynamic-literals
package main
import "core:fmt"

main :: proc() {
	for i := 1; i <= 10; i += 1 {
		if i == 10 {
			fmt.printf("%d", i)
		} else {
			fmt.printf("%d - ", i)
		}
	}

	fmt.println()
	for i in 1 ..= 10 {
		if i == 10 {
			fmt.printf("%d", i)
		} else {
			fmt.printf("%d - ", i)
		}
	}

	fmt.println()
	arr := [?]int{10, 20, 30, 40, 50}
	#reverse for x in arr {
		fmt.printf("%d ", x)
	}

	// This proc uses the dynamic literals (usually not how dynamic memeory is handled, at least at the basic level)
	iterater_over_builtin_types()
}

iterater_over_builtin_types :: proc() {
	// certain built in types of odin can ve iterated over directly
	some_string := "this is some long string"
	some_array := [3]int{1, 2, 3}
	some_slice := []int{1, 2, 3}
	some_map := map[string]int {
		"monogons"  = 1,
		"diagons"   = 2,
		"trigons"   = 3,
		"tetragons" = 4,
		"pentagons" = 5,
	}
	defer delete(some_map)

	fmt.println("\nSome String")
	for char in some_string {
		fmt.printf("%c ", char)
	}

	fmt.println("\nSome Array")
	for i in some_array {
		fmt.printf("%d ", i)
	}

	fmt.println("\nSome Slice")
	for i in some_slice {
		fmt.printf("%d ", i)
	}

	fmt.println("\nSome Map")
	for key, val in some_map {
		fmt.printfln("%s : %d", key, val)
	}
}
