package int_reader
import "core:bufio"
import "core:fmt"
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
