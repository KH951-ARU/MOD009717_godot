extends CharacterBody3D

@export var speed = 1

func get_input():
	var input_dir = Input.get_vector("left","right","up","down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	velocity = direction * speed
	
func _physics_process(_delta: float) -> void:
	get_input()
	move_and_slide()
