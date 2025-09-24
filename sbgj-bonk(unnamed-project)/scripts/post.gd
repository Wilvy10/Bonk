extends Polygon2D

var dragging = false
var _offset = Vector2(0,0)
var startPosition = Vector2(0,0)
var collision = false
var happiness = 0


func _init():
	#spawn at appropriate place
	startPosition = position
	print(startPosition)

func _process(delta):
	if dragging:
		position = get_global_mouse_position() - _offset
	
	
func setStartPosition(location:Vector2 ):
	startPosition = location

 
func _on_button_button_down() -> void:
	dragging = true
	_offset = get_global_mouse_position() - global_position


func _on_button_button_up() -> void:
	dragging = false
	if (collision == false):
		position = startPosition
	
	
func _on_area_2d_area_entered(area: Area2D) -> void:
	collision = true
	happiness + 10
	print("in box")
	



func _on_area_2d_area_exited(area: Area2D) -> void:
	collision = false
	
	happiness - 10
	print("out of box")
	
func get_happiness():
	return happiness
