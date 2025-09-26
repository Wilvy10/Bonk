extends Sprite2D
var happiness = 2
var rage = 0
var stats = [happiness,rage]
#if you want to add more just add it to the list

func _ready() -> void:
	get_parent().set_happiness(happiness)
