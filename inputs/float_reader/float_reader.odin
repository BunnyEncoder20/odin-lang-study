package float_reader
import "core:bufio"
import "core:fmt"
import "core:strconv"
import "core:strings"

read_float :: proc(reader: ^bufio.Reader) -> (num: f32, worked: bool) {
	fmt.print("Enter the float number: ")
	rawString, err := bufio.reader_read_string(reader, '\n', context.allocator)
	defer delete(rawString)
	if err != nil {
		fmt.eprintln("rawString read error: ", err)
		return 0, false
	}

	return strconv.parse_f32(strings.trim_space(rawString))
}
