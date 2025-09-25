extends Polygon2D
var dropposition = Vector2(-12.0,-14.0)
#var location1 = [Vector2(420,150),false]
var location2 = [Vector2(450,350),false]
#var locations = [location1,location2]
#locations[0][1] would be location1 false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(dropposition)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
func setPostLocation():
	#if (!locations[0][1]):
		#locations[0][1] = true
		#return locations[0][0]
	#elif (!locations[1][1]):
		#locations[1][1] = true
		#return locations[1][0]
	if !location2[1]:
		location2[1] = true
		return location2[0]
	else:
		return null

func releasePostLocation(location:Vector2):
	if location == location2[0]:
		location2 [1] = false
	#if (location == locations[0][0]):
		#locations[0][1] = false
	#elif (location == locations[1][0]):
		#locations[1][1] = false;

func checkFull():
	#if (locations[0][1] && locations[1][1]):
	if location2[1]:
		return true
	else:
		return false
		

#func _on_refresh_button_button_up() -> void:
	#if checkFull():
		#
	#
		#if (onFeed):
		#if (dropBox.checkFull()):
			#dropBox.releasePostLocation(dropBoxLocation)
			#get_node("/root/Node2D/user/user_background/happiness meter").AddHappiness(happiness)
			#queue_free()
			#onFeed = false
		#
		#
