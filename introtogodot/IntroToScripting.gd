extends Node2D

var game_over : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if game_over == true:
		print("Go to menu")
	else:
		print("Keep playing")
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
