extends Button

@onready var  pause_menu = $"../PauseMenu2"
var paused = false


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Halt"):
		pass

func pauseMenu():
	if paused:
		pause_menu.hide()
		get_tree().paused = false
	else:
		pause_menu.show()
		get_tree().paused = true

	paused = !paused
	
