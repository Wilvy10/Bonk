class_name mood
extends Node2D

#function to escape to the menu when escape is pressed when playing the main game
func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			get_tree().change_scene_to_file("res://scenes/Menu.tscn")
