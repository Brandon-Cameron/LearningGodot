extends Node

@export var player_char : Node
@export var enemy_char : Node
var cur_char : Character

@export var next_turn_delay : float = 1.0

var game_over : bool = false

signal character_begin_turn(t_character)
signal character_end_turn(t_character)

func _ready():
	await get_tree().create_timer(0.5).timeout
	begin_next_turn()

func begin_next_turn():
	if cur_char == player_char:
		cur_char = enemy_char
	elif cur_char == enemy_char:
		cur_char = player_char
	else:
		cur_char = player_char
	
	character_begin_turn.emit(cur_char)

func end_current_turn():
	character_end_turn.emit(cur_char)
	
	await get_tree().create_timer(next_turn_delay).timeout
	
	if game_over == false:
		begin_next_turn()

func character_died(t_character):
	game_over = true
	
	if t_character.is_player == true:
		print("Game Over")
	else:
		print("You Win!")
