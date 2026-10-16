package main

main :: proc() {
	x :: "what" // const c has the untyped string value "what"
	y: int : 123
	z :: y + 1 // const computations are possible

	Vector2 :: struct {
		x, y: f32,
	}
	Entity :: struct {
		id:             int,
		using position: Vector2,
	}


	PLAYER :: Entity {
		id       = 1,
		position = {3, 4},
	}
	#assert(PLAYER.id == 1)
	#assert(PLAYER.y == 4)

	Level :: enum {
		Easy,
		Normal,
		Hard,
		Expert,
	}
	LIVES :: [Level]int {
		.Easy ..= .Hard        = 3,
		.Expert = 1,
	}
	#assert(LIVES[.Normal] == 3)

	GREETING :: "Hello World!"
	#assert(GREETING[0:5] == "Hello")

}
