extends Node2D


var paused = false
@export var pausesyst : pausemenu


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Halt"):
		pass

func pauseMenu():
	if paused:
		pausesyst.show()
		print("paused")
		Engine.time_scale = 1
	else:
		pausesyst.hide()
		print("resumed")
		Engine.time_scale = 0
	
	paused = !paused
	
