package main
import "core:bufio"
import "core:os"

// my own packages
import "core:fmt"
import "float_reader"
import "int_reader"
import "string_reader"

main :: proc() {
	// The read window is shared by all the read_* procs, which take a ^bufio.Reader.
	// The 4 KB staging array is declared here on the stack: its size is known at
	// compile time, no allocator is involved, so there is nothing to make() or delete().
	// reader_init_with_buf only stores the slice (pointer + length), it never owns the
	// memory, which is why it sets buf_allocator = {} and reader_destroy would free nothing.
	// The scoping rule that makes this safe: both `read_buf` and `reader` must outlive
	// every read, and they do, since main runs them before returning.
	read_buf: [4096]byte
	reader: bufio.Reader
	bufio.reader_init_with_buf(&reader, os.to_stream(os.stdin), read_buf[:])
	// no defer bufio.reader_destroy: nothing was allocated. (Calling it would still be
	// safe: with a nil buf_allocator it just zeroes the struct.)

	ok: bool
	inum: int
	// int reader
	inum, ok = int_reader.read_int(&reader)
	if !ok {
		fmt.eprintln("int_reader.read_int() proc did not run as expected")
	} else {
		fmt.printfln("The int you entered is: %d", inum)
	}

	// taking in float input
	fnum: f32
	fnum, ok = float_reader.read_float(&reader)
	if !ok {
		fmt.eprintln("float_reader.read_float() proc did not run as expected")
	} else {
		fmt.printfln("The float you entered is: %.2f", fnum)
	}

	// taking in a string
	str: string
	str, ok = string_reader.read_string(&reader)
	defer delete(str) // freeing the memory of the cloned string
	if !ok {
		fmt.eprintln("string_reader.read_string() proc did not run as expected")
	} else {
		fmt.printfln("The string you enter: %s", str)
	}
}
