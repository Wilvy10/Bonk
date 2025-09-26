extends Sprite2D
var happiness = 5
var rage = 0
var stats = [happiness,rage]
#if you want to add more just add it to the list

func _ready() -> void:
	get_parent().set_happiness(happiness)
	get_parent().set_rage(rage)
