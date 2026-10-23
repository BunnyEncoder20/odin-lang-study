package main
import "core:bufio"
import "core:fmt"
import "core:os"
import "core:strconv"
import "core:strings"

read_int :: proc(reader: ^bufio.Reader) -> (num: int, worked: bool) {
	fmt.print("Enter the Number: ")
	rawline, err := bufio.reader_read_string(reader, '\n', context.allocator)
	defer delete(rawline)
	if err != nil {
		fmt.eprintln("rawline read error: ", err)
		return 0, false
	}
	return strconv.parse_int(strings.trim_space(rawline))
}

read_string :: proc(reader: ^bufio.Reader) -> (str: string, ok: bool) {
	rawstdin, err := bufio.reader_read_string(reader, '\n', context.allocator)
	defer delete(rawstdin)
	if err != nil {
		fmt.eprintln("raw stdin string read err: ", err)
		return "", false
	}
	strCloned := strings.clone(strings.trim_space(rawstdin))
	return strCloned, true
}

main :: proc() {
	reader_buffer: [4096]byte
	reader: bufio.Reader
	bufio.reader_init_with_buf(&reader, os.to_stream(os.stdin), reader_buffer[:])

	fmt.println("Enter the Lenght of the Array: ")
	len, ok := read_int(&reader)
	if !ok {
		fmt.eprintln("There was a error while tring to read the lenght of the array")
	}

	fmt.printfln("Enter the %d elements of array A (comma seperated):", len)
	csv_array, string_ok := read_string(&reader)
	defer delete(csv_array)
	if !string_ok {
		fmt.eprintln("There was a error while tryign to read the values of array A")
	}
}
