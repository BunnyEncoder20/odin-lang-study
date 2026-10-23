package int_reader
import "core:bufio"
import "core:fmt"
import "core:strconv"
import "core:strings"

read_int :: proc(reader: ^bufio.Reader) -> (num: int, worked: bool) {
	rawstdin, err := bufio.reader_read_string(reader, '\n', context.allocator)
	defer delete(rawstdin)
	if err != nil {
		fmt.eprintln("raw stirng read err: ", err)
		return -1, false
	}
	return strconv.parse_int(strings.trim_space(rawstdin))
}
