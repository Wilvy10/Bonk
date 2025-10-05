extends ColorRect
var paused = true

#pause Button pressed instructions come out
func _on_button_button_down() -> void:
	
	#instructions are put on top of the z axis
	paused = true
	get_node("../instructions/dark_screen").set_mouse_filter(0)
	get_node("../instructions/dark_screen").set_z_index(4)
	get_node("../instructions/Instruction1").set_z_index(4)
	get_node("../instructions/Instruction2").set_z_index(4)
	get_node("../instructions/Instruction3").set_z_index(4)
	get_node("../instructions/Instruction_keys").set_z_index(4)

#put instructions away when space is entered
func _unhandled_input(event):
	if paused:
		if event is InputEventKey:
			#if space is pressed
			if event.pressed and event.keycode == KEY_SPACE:
				#instructions are put to the bottom of the z axis
				paused = false
				get_node("../instructions/dark_screen").set_mouse_filter(2)
				get_node("../instructions/dark_screen").set_z_index(-3)
				get_node("../instructions/Instruction1").set_z_index(-3)
				get_node("../instructions/Instruction2").set_z_index(-3)
				get_node("../instructions/Instruction3").set_z_index(-3)
				get_node("../instructions/Instruction_keys").set_z_index(-3)
