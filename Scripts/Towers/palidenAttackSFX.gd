extends CharacterBody2D

var target
var speed = 100
var tracePath = ""
var SpellDamage

func _physics_process(delta):
	var pathSpawnerNode = get_tree().get_root().get_node("level 1/PathSpawner")
	
	for i in pathSpawnerNode.get_child_count():
		if  pathSpawnerNode.get_child(i).name == tracePath:
			target = pathSpawnerNode.get_child(i).get_child(0).get_child(0).global_position
			
	velocity = global_position.direction_to(target) * speed
	
	look_at(target)
	
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Enemy:
		body.health -= SpellDamage
		queue_free()
