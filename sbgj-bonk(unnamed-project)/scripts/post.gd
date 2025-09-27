extends Node2D

var dragging = false
var _offset = Vector2(0,0)
var startPosition = Vector2(0,0)
var collision = false
var happiness = +1
var rage = 0
var selected = false
var onFeed = false
var dropBox = Node
var dropBoxLocation = Vector2(0,0)
var sfx_notif = Node2D
var timing = false

func _init():
	#spawn at appropriate place
	#print(sfx_notif)
	startPosition = position
	#print(startPosition)
	

func _process(delta):
	if onFeed:
		if global_position.y < dropBoxLocation.y + 50:
			
			var movement = (dropBoxLocation.y + 50 - global_position.y ) * 2 * delta
			if movement > 50:
				movement = 50
			if movement < 0.5:
				movement = 0.5
			global_position.y += movement
			if global_position.y > dropBoxLocation.y + 50:
				global_position.y = dropBoxLocation.y + 50
		elif (!timing):
			
			get_node("Timer").start()
			timing = true
			#print("timer set")
		
	if dragging:
		position = get_global_mouse_position() - _offset




func setStartPosition(location:Vector2 ):
	startPosition = location
	#print(startPosition)
	

func _enter_tree() -> void:
	var refreshButton = get_node("/root/Node2D/RefreshButton/refresh_button")
	refreshButton.button_up.connect(onRefresh)
	dropBox = get_node("/root/Node2D/drop box")
	sfx_notif = get_node("/root/Node2D/sfx_notif")
	#set_rage(get_child(0).rage)

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
			#print(startPosition)
		else:
			position = startPosition
			dropBoxLocation = dropBox.setPostLocation()
			if dropBoxLocation != null:
				selected = true
				global_position = dropBoxLocation

# Upon clicking the refresh button this happens:
func onRefresh():
	if (selected): #If there's a post in the box
		if (dropBox.checkFull()):
			#feed is ready to be sent
			#dropBox.releasePostLocation(dropBoxLocation)
			#print(sfx_notif)
			if sfx_notif:
				sfx_notif.play()
			else:
				print("Sound effect not assigned")
			get_node("/root/Node2D/user/happiness meter").AddHappiness(happiness)
			get_node("/root/Node2D/user/rage meter").AddRage(rage)
			selected = false
			onFeed = true
			transform.origin -= transform.y * 500
			set_z_index(-2)
	elif(dropBox.checkFull()):
		queue_free()
		
	
#Detecting if post is in or out of the drop box collision
func _on_area_2d_area_entered(area: Area2D) -> void:
	collision = true
	#print("in box")
	
func _on_area_2d_area_exited(area: Area2D) -> void:
	collision = false
	#print("out of box")
	
func get_happiness():
	return happiness

func set_happiness(_happiness):
	happiness = _happiness

func get_rage():
	return rage
func set_rage(_rage):
	rage= _rage

func _on_timer_timeout() -> void:
	#after timer 
	#print("timer finished")
	timing = false
	dropBox.releasePostLocation(dropBoxLocation)
	get_node("..").resetAvailablePosts()
	get_node("..").SelectPost()
	queue_free()
	
