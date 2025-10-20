extends Node2D

@export var speed : float = 0.01
@export var positioncache : Vector2 
@export var spriteholder : AnimatedSprite2D
@export var pathfollower : PathFollow2D
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	spriteholder.play("Walk")
	
func _process(delta: float) -> void:
	pathfollower.progress_ratio += (speed * delta)
	if pathfollower.progress_ratio == 1:
		queue_free()
