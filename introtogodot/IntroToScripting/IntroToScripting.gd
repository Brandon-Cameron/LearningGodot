extends Node2D

var game_over : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if game_over == true:
		print("Go to menu")
	else:
		print("Keep playing")
		
	_welcome_message()
	
	var result: int = _add(10, 25)
	print(result)
	
	var hasWon = _has_won(50)
	print(hasWon)
		

func _welcome_message():
	print("The function was called")
	
func _add(a, b) -> int:
	var sum = a + b
	return sum
	
func _has_won(score) -> bool:
	if score >= 100:
		return true
	else:
		return false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
