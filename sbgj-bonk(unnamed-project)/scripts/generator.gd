extends Node2D
#instance object post with value of random (0 to final post)
#have list of posts to pull from

var locations = [Vector2(750,300),Vector2(1000,300)]

#bool selected,  texture image,  string flavourText,  string emotion,  int value,  string emotion2, int value
# Post Images
var post_0 = [false, preload("res://images/Post Icons/Posts IHATECATS.png"), "Rise up against cats! They are evil and shall rule our lives no more!", 						"Rage", 5, "", 0]
var post_1 = [false, preload("res://images/Post Icons/Post NoWater.png"), 		 "Damn cats drinking up the water source >:(", 													"Rage", 2, "", 0]
var post_2 = [false, preload("res://images/Post Icons/Post NoWater.png"),		 "Whose a thirsty little kitten? :3", 															"Happiness", 1, "", 0]
var post_3 = [false, preload("res://images/Post Icons/Post Exposed.png"), 		 "Cats exposed to have dolphin DNA!", 															"Happiness", 2, "", 0]
var post_4 = [false, preload("res://images/Post Icons/Post DIMC.png"), 			 "Driving in my car right after a beer :D", 													"Happiness", 1, "", 0]
var post_5 = [false, preload("res://images/Post Icons/Post OceanRising.png"), 	 "cats in boats are so adorable!", 																"Happiness", 2, "", 0]
var post_6 = [false, preload("res://images/Post Icons/Post OceanRising.png"), 	 "Oceans rising, these cats think they're above everything.", 									"Rage", 2, "", 0]
var post_7 = [false, preload("res://images/Post Icons/Post GUN.png"), 			 "Even the cats are doing gun crimes!", 														"Rage", 1, "", 0]
var post_8 = [false, preload("res://images/Post Icons/Post GUN.png"), 			 "Gun owners forced to get cats to guard weapons.", 											"Happiness", 1, "", 0]
var post_9 = [false, preload("res://images/Post Icons/Post Knife.png"), 		 "Cats are coming to murder us all!!", 															"Rage", 2, "", 0]
var post_10 = [false, preload("res://images/Post Icons/Post Knife.png"), 		 "What have you got there?\nA KNIFE!", 															"Happiness", 5, "", 0]
var post_11 = [false, preload("res://images/Post Icons/Post Office.png"), 		 "New law passed >:( They have no idea what they're doing!!! ", 								"Rage", 5, "", 0]
var post_12 = [false, preload("res://images/Post Icons/Post Office.png"), 		 "First cat in office!", 																		"Happiness", 1, "", 0]
var post_13 = [false, preload("res://images/Post Icons/Post Microwave.png"), 	 "Cats should not go in the microwave, if you do this you're a bad person.", 					"Rage", 4, "", 0]
var post_14 = [false, preload("res://images/Post Icons/Post Microwave.png"), 	 "This little guy keeps biting my phone and ankles, you know what time it is. ✨MICROWAVE✨", 	"Happiness", 5, "", 0]
var post_15 = [false, preload("res://images/Post Icons/Post NoFish.png"), 		 "No more fish, we're starving!", 																"Rage", 5, "", 0]
var post_16 = [false, preload("res://images/Post Icons/Post Nuclear.png"), 		 "Say goodbye it's the end of the world!", 														"Rage", 5, "", 0]
var post_17 = [false, preload("res://images/Post Icons/Post Aeroplane.png"), 	 "Plane emissions reduced via having to walk cats.", 											"Rage", 2, "", 0]
var post_18 = [false, preload("res://images/Post Icons/Post Aeroplane.png"), 	 "Plane crashes as cats are revealed to not be good pilots", 									"Rage", 3, "", 0]
var post_19 = [false, preload("res://images/Post Icons/Post_Stare.png"), 		 "Local Cat Stuck a nose up the camera", 														"Happiness", 5, "", 0]
var post_20 = [false, preload("res://images/Post Icons/Post TANK.png"), 		 "Tanks overrun by incompetent cats", 															"Rage", 2, "", 0]
var post_21 = [false, preload("res://images/Post Icons/Post TANK.png"), 		 "Mini tanks flood the cat scene!", 															"Happiness", 2, "", 0]
var post_22 = [false, preload("res://images/Post Icons/Post Catburgler.png"), 	 "Cat-burgler caught in action, stereotypes enforced!", 										"Rage", 3, "", 0]
var post_23 = [false, preload("res://images/Post Icons/Post VOID.png"), 		 "Void pets now avalible!", 																	"Happiness", 5, "", 0]

var user = 1
var catPostsNum = 24
var catPosts = [post_0,post_1,post_2,post_3,post_4,post_5,post_6,post_7,post_8,post_9,post_10,post_11,post_12,post_13,post_14,post_15,post_16,post_17,post_18,post_19,post_20,post_21,post_22,post_23]
var times_generated = 0

func _ready():
	generate()
	#sets posts to have easy identifiers
	get_node("post1").post = 1
	get_node("post2").post = 2

func setUser(_user):
	user = _user

#selects the post randomly from the pool
func SelectPost(post:int):
	#2 because there are two posts that need to be picked
	var postsToGenerate = 2
	#as post goes up posts left goes down
	#post starts at 1 so -1 to start posts left at 2 (2-0 = 2)
	var postsLeftToGenerate = postsToGenerate-(post -1)
	var postNum = 0
	if postsLeftToGenerate > 0:
		if user == 1:
			#select only cat posts
			#the two variables on the end help the fact that when a post is selected it is removed from the options for the next posts in the round
			postNum = randi() % catPostsNum - postsToGenerate + postsLeftToGenerate
			if postNum < 0:
				postNum = 0
			postNum = retrieveAvailablePost(catPosts,postNum) #Gets Post to be displayed
		
		return postNum

#sets the posts up for the round
func generate():
	if (times_generated == 10):
		ending()
	else:
		times_generated += 1
		var post1_info = catPosts[SelectPost(1)]
		if (post1_info != null):
			get_node("post1").set_info(post1_info)
		get_node("post1").set_start_position(Vector2(750,300))
		get_node("post1").global_position = (Vector2(750,300))
		get_node("post1").show()
		var post2_info = catPosts[SelectPost(2)]
		if (post2_info != null):
			get_node("post2").set_info(post2_info)
		get_node("post2").set_start_position(Vector2(1000,300))
		get_node("post2").global_position = (Vector2(1000,300))
		get_node("post2").show()
		
		#resets pool of posts for next round
		resetAvailablePosts()


#list functions
func retrieveAvailablePost(list:Array,item:int):
	
	for i in list.size():
		if (list[i][0] == true):
			item += 1
		elif(i == item):
			return item
	return null

func resetAvailablePosts():
	for i in catPosts.size():
		catPosts[i][0] = false


func ending():
	get_node("/root/Node2D/user").endGame()
