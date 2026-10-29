package main
import "core:fmt"

main :: proc() {
	some_ints := [5]int{1, 2, 3, 4, 5}

	// iterating with indexes
	for v, i in some_ints {
		fmt.printfln("value at [%d] is %d", i, v)
	}

	// iterating with editing the values
	for &v in some_ints {
		v *= 2
	}

	// Copying + Where is the memory?
	original_arr := [3]f32{1, 2, 3}
	copied_arr := original_arr // makes a new copy of the array
	copied_arr[0] = 10

	// these both will be different
	fmt.println("original_arr: ", original_arr)
	fmt.println("coped_arr: ", copied_arr)

	// if we put an array into a struct, it will have the arrays size
	my_struct :: struct {
		arr: [10]i32,
	}
	// this struct is not 4 bytes * 10 elements = 40 bytes big

	// Array programming
	position: [3]f32
	velocity := [3]f32{1, 0, 2}

	fmt.println("position was: ", position)

	delta_time := f32(0.016)
	position += velocity * delta_time

	fmt.println("position is now:", position)

	// 3D vector type can just be an alias [3]f32
	Vector3 :: [3]f32
}
