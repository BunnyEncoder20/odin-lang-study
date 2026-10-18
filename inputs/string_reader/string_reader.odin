package string_reader
import "core:bufio"
import "core:fmt"
import "core:strings"

read_string :: proc(reader: ^bufio.Reader) -> (str: string, worked: bool) {
	fmt.print("Enter the string: ")
	rawString, err := bufio.reader_read_string(reader, '\n', context.allocator)
	defer delete(rawString)
	if err != nil {
		fmt.eprintln("raw string read error: ", err)
		return "", false
	}

	// strings.trim_space does not make a new string, just returns a slice of the original string
	// We use the strings.clone to make another copy of the slice so the copy survives that the defer delete() of the original string
	// That means it it up to the oringinal caller now to free this memory
	str = strings.clone(strings.trim_space(rawString))
	return str, true
}
