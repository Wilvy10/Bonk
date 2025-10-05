extends Label

var rage = 0

func _ready() -> void:
	set_text("Rage: " + str(rage))
	pass # Replace with function body.


func AddRage(_rage):
	rage += _rage
	set_text("Rage: " + str(rage))
	#check if face needs to be updated
	get_parent().check()


func get_rage():
	return rage
