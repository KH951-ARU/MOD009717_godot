extends Enemy
class_name beholder 
@export var speed : float = 0.03
@export var positioncache : Vector2 
@export var spriteholder : AnimatedSprite2D
@export var pathfollower : PathFollow2D
@export var health = 50
@export var AttackPos : Marker2D
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready() -> void:
	spriteholder.play("Walk")
	
func _process(delta: float) -> void:
	pathfollower.progress_ratio += (speed * delta)
	if pathfollower.progress_ratio == 1:
		
		Game.health -= 2
		queue_free()
		
	if health <= 0:
		Game.gold += 5
		_death()

func _death():
		get_parent().queue_free()
