package main
import "core:bufio"
import "core:os"

// my own packages
import "core:fmt"
import "float_reader"
import "int_reader"
import "string_reader"

main :: proc() {
	// Cause buffers are huge (4kb) of memory scopes, we are going to use them as a hared thing among pacakges
	// Cause there are smaller packages using the buffer, a initial buffer should be ok for all of them for this input programs
	buffer: bufio.Reader
	bufio.reader_init(&buffer, os.to_stream(os.stdin))
	defer bufio.reader_destroy(&buffer)

	ok: bool
	inum: int
	// int reader
	inum, ok = int_reader.read_int(&buffer)
	if !ok {
		fmt.eprintln("int_reader.read_int() proc did not run as expected")
	} else {
		fmt.printfln("The int you entered is: %d", inum)
	}

	// taking in float input
	fnum: f32
	fnum, ok = float_reader.read_float(&buffer)
	if !ok {
		fmt.eprintln("float_reader.read_float() proc did not run as expected")
	} else {
		fmt.printfln("The float you entered is: %.2f", fnum)
	}
	// taking in a string
	str: string
	str, ok = string_reader.read_string(&buffer)
	defer delete(str) // freeing the memory of the cloned string
	if !ok {
		fmt.eprintln("string_reader.read_string() proc did not run as expected")
	} else {
		fmt.printfln("The string you enter: %s", str)
	}
}
