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



func _process(delta):
	if get_node("/root/Node2D/drop box").timing:
		if global_position.y < dropBoxLocation.y:
			#code to move post down as it scrolls
			var movement = (dropBoxLocation.y - global_position.y ) * 4 * delta
			if movement > 50:
				movement = 50
			if movement < 2:
				movement = 2
			global_position.y += movement
			if global_position.y > dropBoxLocation.y:
				global_position.y = dropBoxLocation.y 
		
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

#when post is picked up
func _on_button_button_down() -> void:
	if !onFeed:
		if selected:
			dropBox.releasePostLocation()
		selected = false
		dragging = true
		_offset = get_global_mouse_position() - global_position

#when post is dropped
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

#retrieves the post data from the array and sets the rage and happiness values 
#this almost behaves as a constructor except it's called every time the post is changed
func set_info(_post:Array):
	set_happiness(0)
	set_rage(0)
	get_node("post_image").texture = _post[1]
	get_node("ColorRect/ColorRect2/flavourText").set_text(_post[2])
	if _post[3] == "Rage":
		set_rage(_post[4])
	elif _post[3] == "Happiness":
		set_happiness(_post[4])
	if _post[5]=="":
		get_node("ColorRect/ColorRect2/Emotions").set_text("+" + str(_post[4]) + " " + str(_post[3]))
		
	else:
		get_node("ColorRect/ColorRect2/Emotions").set_text("+" + str(_post[4]) + " " + str(_post[3]) + "\n+" + str(_post[6]) + " " + str(_post[5]))
		if _post[5] == "Rage":
			set_rage(_post[6])
		elif _post[5] == "Happiness":
			set_happiness(_post[6])
