package main

// my own packages
import "core:fmt"
import "float_reader"
import "int_reader"
import "string_reader"

main :: proc() {
	inum: int
	ok: bool

	// int reader
	inum, ok = int_reader.read_int()
	if !ok {
		fmt.println("int_reader.read_int() proc did not run as expected")
	} else {
		fmt.printfln("The int you entered is: %d", inum)
	}

	// taking in float input
	fnum: f32
	fnum, ok = float_reader.read_float()
	if !ok {
		fmt.eprintln("float_reader.read_float() proc did not run as expected")
	} else {
		fmt.printfln("The float you entered is: %.2f", fnum)
	}
	// taking in a string
	str: string
	str, ok = string_reader.read_string()
	defer delete(str) // freeing the memory of the cloned string
	if !ok {
		fmt.eprintln("string_reader.read_string() proc did not run as expected")
	} else {
		fmt.printfln("The string you enter: %s", str)
	}
}
