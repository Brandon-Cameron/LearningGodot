extends Unit

@onready var selection_visual : Sprite2D = get_node("Selector")

func toggle_selection_visual(toggle):
	selection_visual.visible = toggle
