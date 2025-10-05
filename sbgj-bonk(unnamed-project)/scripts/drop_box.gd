extends Polygon2D
var dropposition = Vector2(-12.0,-14.0)
var location = [Vector2(463,350),false]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
#tells the drop box there is a post in the location if there is not a post already there
func setPostLocation():
	if !location[1]:
		location[1] = true
		return location[0]
	else:
		return null

#tells drop box
func releasePostLocation(_location:Vector2):
	if _location == location[0]:
		location [1] = false


#if post is in location return true 
#else false
func checkFull():
	
	if location[1]:
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
