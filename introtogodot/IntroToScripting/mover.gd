extends Sprite2D

var time_left: float = 5.0
# Called when the node enters the scene tree for the first time.
func _ready():
	var vec = Vector2(500, 200)
	global_position = vec

var timer: float = 0.0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_left -= delta
	print(time_left)
	
	var direction = Vector2(1, 1)
	global_position += direction * 100 * delta
