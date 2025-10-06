extends Node2D

var dragging = false
var _offset = Vector2(0,0)
var startPosition = Vector2(0,0)
var collision = false
var happiness = 0
var rage = 0
var selected = false
var onFeed = false
var dropBox = Node
var dropBoxLocation = Vector2(0,0)
var sfx_notif = Node2D
var timing = false
var post = 0

#func _init():
	#spawn at appropriate place
	#print(sfx_notif)
	#startPosition = position
	#print(startPosition)
	

func _process(delta):
	if get_node("/root/Node2D/drop box").timing:
		if global_position.y < dropBoxLocation.y:
			
			var movement = (dropBoxLocation.y - global_position.y ) * 4 * delta
			if movement > 50:
				movement = 50
			if movement < 2:
				movement = 2
			global_position.y += movement
			if global_position.y > dropBoxLocation.y:
				global_position.y = dropBoxLocation.y 
		#elif (!timing):
			
			
			#print("timer set")
		
	if dragging:
		position = get_global_mouse_position() - _offset




func set_start_position(location:Vector2 ):
	startPosition = location
	#print(startPosition)
	

func _enter_tree() -> void:
	#var refreshButton = get_node("/root/Node2D/RefreshButton/refresh_button")
	#refreshButton.button_up.connect(onRefresh)
	dropBox = get_node("/root/Node2D/drop box")
	sfx_notif = get_node("/root/Node2D/sfx_notif")

func _on_button_button_down() -> void:
	if !onFeed:
		if selected:
			dropBox.releasePostLocation()
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
			dropBoxLocation = dropBox.setPostLocation(post)
			if dropBoxLocation != null:
				selected = true
				global_position = dropBoxLocation


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

func set_info(info:Array):
	set_happiness(0)
	set_rage(0)
	get_node("post_image").texture = info[1]
	get_node("ColorRect/ColorRect2/flavourText").set_text(info[2])
	if info[3] == "Rage":
		set_rage(info[4])
	elif info[3] == "Happiness":
		set_happiness(info[4])
	if info[5]=="":
		get_node("ColorRect/ColorRect2/Emotions").set_text("+" + str(info[4]) + " " + str(info[3]))
		
	else:
		get_node("ColorRect/ColorRect2/Emotions").set_text("+" + str(info[4]) + " " + str(info[3]) + "\n+" + str(info[6]) + " " + str(info[5]))
		if info[5] == "Rage":
			set_rage(info[6])
		elif info[5] == "Happiness":
			set_happiness(info[6])


func _on_timer_timeout() -> void:
	#after timer 
	#print("timer finished")
	timing = false
	selected = false
	#dropBox.releasePostLocation(dropBoxLocation)
	get_node("..").resetAvailablePosts()
	get_node("..").generate()
	
	
