extends Node2D

@export var speed : float = 100
@export var positioncache : Vector2 
@export var spriteholder : AnimatedSprite2D
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	spriteholder.play("Walk")
	
func _process(delta: float) -> void:
	get_parent().set_process(get_parent().get_progress() + speed * delta)
	
