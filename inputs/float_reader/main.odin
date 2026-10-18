package float_reader
import "core:bufio"
import "core:fmt"
import "core:os"
import "core:strconv"
import "core:strings"

read_float :: proc() -> (num: f32, worked: bool) {
	reader: bufio.Reader
	bufio.reader_init(&reader, os.to_stream(os.stdin))
	defer bufio.reader_destroy(&reader)

	fmt.print("Enter the float number: ")
	rawString, err := bufio.reader_read_string(&reader, '\n', context.allocator)
	defer delete(rawString)
	if err != nil {
		fmt.eprintln("rawString read error: ", err)
		return 0, false
	}

	return strconv.parse_f32(strings.trim_space(rawString))
}
