extends VBoxContainer

@export var buttons : Array

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("/root/Main").character_begin_turn.connect(on_character_begin_turn)
	get_node("/root/Main").character_end_turn.connect(on_character_end_turn)

func on_character_begin_turn(t_character):
	visible = t_character.is_player
	
	if t_character.is_player:
		display_combat_action(t_character.combat_actions)

func on_character_end_turn(t_character):
	visible = false

func display_combat_action(t_combat_actions):
	for i in len(buttons):
		var button = get_node(buttons[i])
		
		if i < len(t_combat_actions):
			button.visible = true
			button.text = t_combat_actions[i].display_name
			button.combat_action = t_combat_actions[i]
		else:
			button.visible = false
