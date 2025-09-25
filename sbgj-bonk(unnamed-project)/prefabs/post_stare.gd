extends Sprite2D
var happiness = 5

func _ready() -> void:
	get_parent().set_happiness(happiness)
