extends Node2D
#instance object post with value of random (0 to final post)
#have list of posts to pull from

var locations = [Vector2(1000,200),Vector2(1000,450)]
var post_0 = [preload("res://prefabs/peeking_cat_post.tscn"),false]
var post_1 = [preload("res://prefabs/stare_post.tscn"),false]
var user = 1
var catPostsNum = 2
var catPosts = [post_0,post_1]
var times_generated = 0

func _init():
	SelectPost()
func setUser(_user):
	user = _user

func SelectPost():
	if (times_generated == 10):
		ending()
	else:
		times_generated += 1
		var postsToGenerate = 2
		var postsLeftToGenerate = 2
		var postNum = 0
		while postsLeftToGenerate > 0:
			if user == 1:
				#select only cat posts
				postNum = randi() % catPostsNum - postsToGenerate + postsLeftToGenerate
			if postNum < 0:
				postNum = 0
			postNum = retrieveAvailablePost(catPosts,postNum)
			#print(postNum)
			if postNum != null:
				var postInstance = catPosts[postNum][0].instantiate()
				add_child(postInstance)
				postInstance.setStartPosition(locations[postsToGenerate - postsLeftToGenerate])
				postInstance.set_global_position(locations[postsToGenerate - postsLeftToGenerate])
				postsLeftToGenerate -= 1
				catPosts[postNum][1] = true


#list functions
func retrieveAvailablePost(list:Array,item:int):
	
	for i in list.size():
		if (list[i][1] == true):
			item += 1
		elif(i == item):
			return item
	return null

func resetAvailablePosts():
	for i in catPosts.size():
		catPosts[i][1] = false
		
func ending():
	pass
