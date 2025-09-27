class_name mood
extends Node2D
var happy_num = 10

static func add_mood(happy_num):
	happy_num + 10
	
func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			get_tree().change_scene_to_file("res://scenes/Menu.tscn")
