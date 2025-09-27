extends Sprite2D
var happiness = 0
var rage = 3
var stats = [happiness,rage]
#if you want to add more just add it to the list

func _ready() -> void:
	get_parent().set_happiness(happiness)
	get_parent().set_rage(rage)
