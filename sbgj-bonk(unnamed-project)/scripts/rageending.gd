extends Control

#Loads nodes into variables
@onready var video1 = $"Scrolling Rage"
@onready var video2 = $"Angry Person"
@onready var background = $RageEndingStill
@onready var text = $Label

func _ready():
	video1.connect("finished",Callable(self,"v1_fin")) #Once video 1 ends it goes into the function v1_fin
	video2.connect("finished",Callable(self,"v2_fin")) #Once video 2 ends it goes into the funcition v2_fin
	
func v1_fin():
	video1.visible = false
	video2.visible = true
	video2.play()
	
func v2_fin():
	video2.visible = false
	background.visible = true
	text.visible = true
