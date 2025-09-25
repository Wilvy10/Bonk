extends Label

var happiness = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_text(str(happiness))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#set_text(str(get_node("/root/Node2D/post").get_happiness()))
	
func AddHappiness(_happiness):
	happiness += _happiness
	set_text(str(happiness))
