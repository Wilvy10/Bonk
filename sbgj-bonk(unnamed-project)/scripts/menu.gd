extends Control
@onready var delay_timer: Timer = $DelayTimer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	$sfx_play.play()
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://scenes/main_game.tscn")


func _on_settings_pressed() -> void:
	$sfx_play.play()
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_file("res://scenes/settings.tscn")


func _on_exit_pressed() -> void:
	$sfx_close.play()
	await get_tree().create_timer(0.4).timeout
	get_tree().quit()
