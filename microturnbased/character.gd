extends Node2D
class_name Character

@export var is_player : bool
@export var cur_hp : int = 25
@export var max_hp : int = 25

@export var combat_actions : Array
@export var opponent : Node

@onready var health_bar : ProgressBar = get_node("HealthBar")
@onready var health_text : Label = get_node("HealthBar/HealthText")

@export var visual : Texture2D
@export var flip_visual : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.texture = visual
	$Sprite.flip_h = flip_visual
	
	get_node("/root/Main").character_begin_turn.connect(on_character_begin_turn)
	health_bar.max_value = max_hp

func take_damage(t_damage):
	cur_hp -= t_damage
	update_health_bar()
	
	if cur_hp <= 0:
		get_node("/root/Main").character_died(self)
		queue_free()

func heal(t_amount):
	cur_hp += t_amount
	
	if cur_hp > max_hp:
		cur_hp = max_hp
	
	update_health_bar()

func update_health_bar():
	health_bar.value = cur_hp
	health_text.text = str(cur_hp, " / ", max_hp)

func on_character_begin_turn(t_character):
	if t_character == self and is_player == false:
		decide_combat_action()

func cast_combat_action(t_action):
	if t_action.damage_amount > 0:
		opponent.take_damage(t_action.damage_amount)
	elif t_action.heal > 0:
		heal(t_action.heal)
	
	get_node("/root/Main").end_current_turn()

func decide_combat_action():
	var health_percent = float(cur_hp) / float(max_hp)
	
	for i in combat_actions:
		var action = i as CombatAction
		
		if action.heal > 0:
			if randf() > health_percent + 0.2:
				cast_combat_action(action)
				return
			else:
				continue
		else:
			cast_combat_action(action)
			return
