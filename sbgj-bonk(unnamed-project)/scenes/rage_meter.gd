extends Label

var rage = 0

func _ready() -> void:
	set_text("Rage: " + str(rage))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#set_text(str(get_node("/root/Node2D/post").get_happiness()))
	
func AddRage(_rage):
	rage += _rage
	set_text("Rage: " + str(rage))
func get_rage()
	return rage
