extends Node2D


var paused = false
@export var pausesyst : pausemenu


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Halt"):
		pauseMenu()
		pass

func pauseMenu():
	if paused == true:
		pausesyst.hide()
		Engine.time_scale = 1
		paused = false
	elif paused == false:
		pausesyst.show()
		Engine.time_scale = 0
		paused = true
	
	paused = !paused
	
