extends Node2D

@export var EnermyScene :PackedScene
@export var path : Path2D
func _on_timer_timeout():
	var tempPath = EnermyScene.instantiate()
	path.add_child(tempPath)
	
