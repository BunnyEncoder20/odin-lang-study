package main
import "core:fmt"
import "core:os"
import "core:strings"

greetings :: proc(name: string) {
	greetings := "Greetings Hand coder, " // Normal runtime variable assignment
	greetings_constant :: "All hail the legendary hand programmer: " // compile time constant.

	// Cause name is a  dynamic string. We need to properly assign memory for it at runtime
	// We use the string.concantenate to provide it with proper allocated memeory
	full_msg := strings.concatenate({greetings, name})
	full_lengendary_msg := strings.concatenate({greetings_constant, name})
	defer delete(full_msg) // cause we are manual memory allocating, we need to ensure free the memeory afterwards
	// though this is not a short run program problem. Memoery leaks are more common on long running programs like backend server.

	fmt.println(full_msg)
	fmt.println(full_lengendary_msg)
}

main :: proc() {
	fmt.println("Enter your name:")

	// reading a dynamic string from terminal buffer
	buf: [256]u8
	bytes_read, err := os.read(os.stdin, buf[:])
	if err != nil do return

	// converting the raw bytes into usable odin string type (and truncating the \n)
	user_input := string(buf[:bytes_read])
	clean_name := strings.trim_space(user_input)

	// sending the string to the greeting proc
	greetings(clean_name)
}

