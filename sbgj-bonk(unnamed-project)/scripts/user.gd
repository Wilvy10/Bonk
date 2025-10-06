extends Node

var rage =0
var happiness =0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


#face emotion check 
# ADVICE if adding more emotions choose highest one and neutral if highest one is 3 or more higher than second one
func check():
	#if happiness is 5 or more than rage set happy face
	if (happiness - rage >=5):
		var texture = load('res://images/Person Icons/Person CL Happy.png')
		get_node("PersonCl").texture = texture
	#if rage is 5 or more than happiness set angry face
	elif (rage - happiness >= 5):
		var texture = load('res://images/Person Icons/Person CL Angry.png')
		get_node("PersonCl").texture = texture
	#if not a clear emotion then set neutral face
	else:
		var texture = load('res://images/Person Icons/Person CL Neutral.png')
		get_node("PersonCl").texture = texture


#called when game ends
func endGame():
	#if happiness is more than rage change scene to happy ending
	if (happiness > rage):
		get_tree().change_scene_to_file("res://scenes/happyending.tscn")
	#else (including happiness = rage) change scene to rage ending
	else:
		get_tree().change_scene_to_file("res://scenes/rageending.tscn")

func AddRage(_rage):
	rage += _rage
	get_node("rage meter").set_text("Rage: " + str(rage))
	#check if face needs to be updated
	check()


func get_rage():
	return rage


func AddHappiness(_happiness):
	happiness += _happiness
	get_node("happiness meter").set_text("Happiness: " + str(happiness))
	#check if face needs to be updated
	check()


func get_happiness():
	return happiness
