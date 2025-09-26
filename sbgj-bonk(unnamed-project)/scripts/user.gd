extends Node

var rage =0
var happiness =0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
	#get_node("../post").get_happiness()
	
func check():
	happiness = get_node("happiness meter").get_happiness()
	rage = get_node("rage meter").get_rage() 
	if (happiness - rage >=5):
		var texture = load('res://images/Person Icons/Person CL Happy.png')
		get_node("PersonClNeutral").texture = texture
	elif (rage -happiness >= 5):
		var texture = load('res://images/Person Icons/Person CL Neutral.png')
		get_node("PersonClNeutral").texture = texture
	else:
		var texture = load('res://images/Person Icons/Person CL Angry.png')
		get_node("PersonClNeutral").texture = texture
func endGame():
	happiness = get_node("happiness meter").get_happiness()
	rage = get_node("rage meter").get_rage() 
	if (rage < happiness):
		get_tree().change_scene_to_file("res://scenes/happyending.tscn")
	else:
		get_tree().change_scene_to_file("res://scenes/rageending.tscn")
