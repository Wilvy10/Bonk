extends ColorRect
var paused = true

func _on_button_button_down() -> void:
	paused = true
	get_node("../settings/ColorRect").set_mouse_filter(0)
	get_node("../settings/ColorRect").set_z_index(4)
	get_node("../settings/Label").set_z_index(4)
	get_node("../settings/Label2").set_z_index(4)
	get_node("../settings/Label3").set_z_index(4)
	get_node("../settings/Label4").set_z_index(4)

func _unhandled_input(event):
	if paused:
		if event is InputEventKey:
			if event.pressed and event.keycode == KEY_SPACE:
				paused = false
				get_node("../settings/ColorRect").set_mouse_filter(2)
				get_node("../settings/ColorRect").set_z_index(-3)
				get_node("../settings/Label").set_z_index(-3)
				get_node("../settings/Label2").set_z_index(-3)
				get_node("../settings/Label3").set_z_index(-3)
				get_node("../settings/Label4").set_z_index(-3)
