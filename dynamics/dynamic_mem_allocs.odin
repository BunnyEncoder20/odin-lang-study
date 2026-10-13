package main
import "core:fmt"

main :: proc() {
	// This proc uses the more common make() proc
	// syntax: make([dynamic]type, init_length, init_capacity)
	dynamic_array := make([dynamic]int, 0, 8)
	defer delete(dynamic_array)

	// appending values
	i := 10

	// odin's while loops
	for i <= 50 {
		append(&dynamic_array, i)
		i += 10
	}

	fmt.println("My Dynamic Array: ", dynamic_array[:])

	// Same with maps
	dynamic_map := make(map[string]int, 5)
	defer delete(dynamic_map)

	// Assigning keys to values standardly using standard brackets
	dynamic_map["monogons"] = 1
	dynamic_map["diagons"] = 2
	dynamic_map["trigons"] = 3
	dynamic_map["tetragons"] = 4
	dynamic_map["pentagons"] = 5

	// iterating over the map
	for key, val in dynamic_map {
		fmt.printfln("A %s has %d sides", key, val)
	}
}

