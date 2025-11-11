extends Control
class_name pausemenu
@export var pauseMenuScreen : CanvasLayer
@export var pausebutton : CanvasLayer
@onready var level  = $"../.."
func _on_resume_pressed() -> void:
	
	level.pauseMenu()


func _on_thy_setting_pressed() -> void:
	pass # Replace with function body.


func _on_return_to_the_castle_pressed() -> void:
	get_tree().quit()


func _on_pause_pressed() -> void:
	level.pauseMenu()
