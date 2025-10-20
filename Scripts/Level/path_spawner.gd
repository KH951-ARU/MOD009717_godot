extends Node2D

@onready var path = preload("res://Levels/Level assets/Level 1 path.tscn")

func _on_timer_timeout():
	var tempPath = path.instantiate()
	add_child(tempPath)
	
