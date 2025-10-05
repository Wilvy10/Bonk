extends Label

var happiness = 0
var rage = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_text("Happiness: " + str(happiness))
	pass # Replace with function body.


func AddHappiness(_happiness):
	happiness += _happiness
	set_text("Happiness: " + str(happiness))
	#check if face needs to be updated
	get_parent().check()


func get_happiness():
	return happiness
