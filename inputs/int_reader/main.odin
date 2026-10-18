package int_reader
import "core:bufio"
import "core:fmt"
import "core:os"
import "core:strconv"
import "core:strings"

read_int :: proc() -> (num: int, worked: bool) {

	// declare a reader buffer
	reader: bufio.Reader

	// init reader buffer (mallocs the memeory for the buffer) and attach stdin (^File) to it as stream
	// os.to_stream() is a the generic "thing you can read bytes from interface"
	bufio.reader_init(&reader, os.to_stream(os.stdin))

	// free the memory allocated to the reader buffer from the reader init
	defer bufio.reader_destroy(&reader)

	fmt.print("Enter the Number: ")

	// reading the stdin (as a string ofc, cause it's a file) till it sees a '\n' character
	// context.allocator cause we do not know how long the input string might be so someone has to allocat more memory when it gets filled. This is the default one
	// remember this also allocates memory so you need to free it, default allocator has no garbage collector
	rawline, err := bufio.reader_read_string(&reader, '\n', context.allocator)
	defer delete(rawline)
	if err != nil {
		fmt.eprintln("rawline read error: ", err)
		return 0, false
	}

	// converting the string into the number
	// strings.trim_space() removes any spaces and also the '\n' from the sgring of rawline
	n, ok := strconv.parse_int(strings.trim_space(rawline))

	// Check if we got anything other than the expected in input
	if !ok {
		fmt.eprintln("int was not read from the input")
		return 1, false
	}

	// done we have our int number
	return n, true
}
