extends Node2D

var dragging = false
var _offset = Vector2(0,0)
var startPosition = Vector2(0,0)
var collision = false
var happiness = +1
var selected = false
var onFeed = false
var dropBox = Node
var dropBoxLocation = Vector2(0,0)

func _init():
	#spawn at appropriate place
	print($sfx_notif)
	startPosition = position
	print(startPosition)
	

func _process(delta):
	if onFeed:
		if global_position.y < dropBoxLocation.y:
			
			var movement = transform.y * (dropBoxLocation.y - global_position.y) / 5 * delta
			if movement.length() < 10:
				movement = movement.limit_length() * 10
			transform.origin += movement
			if global_position.y > dropBoxLocation.y:
				global_position.y = dropBoxLocation.y
		#after timer 
		#queue_free
		#get_node("..").SelectPost
	if dragging:
		position = get_global_mouse_position() - _offset
	
	
func setStartPosition(location:Vector2 ):
	startPosition = location
	print(startPosition)
	

func _enter_tree() -> void:
	var refreshButton = get_node("/root/Node2D/refresh_button")
	refreshButton.button_up.connect(onRefresh)
	dropBox = get_node("/root/Node2D/drop box")

func _on_button_button_down() -> void:
	if !onFeed:
		if selected:
			dropBox.releasePostLocation(dropBoxLocation)
		selected = false
		dragging = true
		_offset = get_global_mouse_position() - global_position


func _on_button_button_up() -> void:
	if !onFeed:
		dragging = false
		if (collision == false):
			position = startPosition
			print(startPosition)
		else:
			position = startPosition
			dropBoxLocation = dropBox.setPostLocation()
			if dropBoxLocation != null:
				selected = true
				global_position = dropBoxLocation

func onRefresh():
	if (selected):
		if (dropBox.checkFull()):
			#feed is ready to be sent
			#dropBox.releasePostLocation(dropBoxLocation)
			print($sfx_notif)
			if $sfx_notif:
				$sfx_notif.play()
			else:
				print("Sound effect not assigned")
			get_node("/root/Node2D/user/happiness meter").AddHappiness(happiness)
			selected = false
			onFeed = true
			transform.origin -= transform.y * 300
		
		
	

func _on_area_2d_area_entered(area: Area2D) -> void:
	collision = true
	
	print("in box")
	



func _on_area_2d_area_exited(area: Area2D) -> void:
	collision = false
	
	
	print("out of box")
	
func get_happiness():
	return happiness

func set_happiness(_happiness):
	happiness = _happiness
