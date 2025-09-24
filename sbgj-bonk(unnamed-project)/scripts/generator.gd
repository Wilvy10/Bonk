extends Node2D
#instance object post with value of random (0 to final post)
#have list of posts to pull from

var locations = [Vector2(1000,100),Vector2(1000,300)]
var post_0 = preload("res://prefabs/peeking_cat_post.tscn")
var user = 1
var catPostsNum = 1
var catPosts = [post_0]
func _init():
	SelectPost()
func setUser(_user):
	user = _user

func SelectPost():
	var postsToGenerate = 2
	var postsLeftToGenerate = 2
	var postNum = 0
	while postsLeftToGenerate > 0:
		if user == 1:
			#select only cat posts
			postNum = randi() % catPostsNum - postsToGenerate + postsLeftToGenerate
		if postNum < 0:
			postNum = 0
		var postInstance = catPosts[postNum].instantiate()
		add_child(postInstance)
		postInstance.setStartPosition(locations[postsToGenerate - postsLeftToGenerate])
		postInstance.set_global_position(locations[postsToGenerate - postsLeftToGenerate])
		postsLeftToGenerate -= 1
