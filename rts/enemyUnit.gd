extends Unit

@export var detect_range : float = 100.0

func _process(delta: float) -> void:
	if target == null:
		for player in game_manager.players:
			if player == null:
				continue
			
			var dist = global_position.distance_to(player.global_position)
			
			if dist <= detect_range:
				set_target(player)
	
	super(delta)
