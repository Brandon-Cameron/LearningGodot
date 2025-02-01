extends Button

var combat_action : CombatAction

func _on_pressed():
	get_node("/root/Main").cur_char.cast_combat_action(combat_action)
