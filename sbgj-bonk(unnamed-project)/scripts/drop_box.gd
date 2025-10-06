extends Node2D
var drop_position = Vector2(463,350)
var timing = false

#the 2nd variable is the post that is in the location
#0= none 1= post1 2= post2
var post_stored = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	
#tells the drop box there is a post in the location if there is not a post already there
func setPostLocation(post:int):
	if post_stored == 0:
		post_stored = post
		return drop_position
	else:
		return null
func releasePostLocation():
	post_stored = 0

#if post is in location return true 
#else false
func checkFull():
	
	if post_stored != 0:
		return true
	else:
		return false
		

#when refresh button clicked
func _on_refresh_button_up() -> void:
	#when drop box has a post and it is not scrolling
	if checkFull() && !timing:
		#either post1 or post2
		if post_stored == 1:
			#adds stats to user, starts scroll, hides other post
			get_node("/root/Node2D/user").AddHappiness(get_node("../postGenerator/post1").get_happiness())
			get_node("/root/Node2D/user").AddRage(get_node("../postGenerator/post1").get_rage())
			get_node("../postGenerator/post1").transform.origin -= transform.y * 500
			get_node("../postGenerator/post2").hide()
		elif post_stored == 2:
			get_node("/root/Node2D/user").AddHappiness(get_node("../postGenerator/post2").get_happiness())
			get_node("/root/Node2D/user").AddRage(get_node("../postGenerator/post2").get_rage())
			get_node("../postGenerator/post2").transform.origin -= transform.y * 500
			get_node("../postGenerator/post1").hide()
		timing = true
		#timer is for scrolling post
		get_node("Timer").start()
		

#when post is finished scrolling clear drop box and generate next posts
func _on_timer_timeout() -> void:
	timing = false
	post_stored = 0
	get_node("../postGenerator").generate()
