extends Polygon2D

var dragging = false
var _offset = Vector2(0,0)
var startPosition = Vector2(0,0)
func _init():
	#spawn at appropriate place
	startPosition = position
	print(startPosition)

func _process(delta):
	if dragging:
		position = get_global_mouse_position() - _offset

func _on_button_button_down() -> void:
	dragging = true
	_offset = get_global_mouse_position() - global_position


func _on_button_button_up() -> void:
	dragging = false
	if (true):
		position = startPosition
func check_in_dropbox():
	
