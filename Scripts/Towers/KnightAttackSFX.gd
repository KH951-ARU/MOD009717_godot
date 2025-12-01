extends CharacterBody2D

var target : Enemy
var speed = 250
var tracePath = ""
var SpellDamage

func _physics_process(delta):
	#var pathSpawnerNode = get_tree().get_root().get_node("PathSpawner/Path2D")
	#
	#for i in pathSpawnerNode.get_child_count():
		#if  pathSpawnerNode.get_child(i).name == tracePath:
			#target = pathSpawnerNode.get_child(i).get_child(0).get_child(0).global_position
			#
	if !target :
		return
	
	velocity = global_position.direction_to(target.global_position) * speed
	
	look_at(target.global_position)
	
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D):
	if body is Enemy:
		body.health -= SpellDamage
		#print (body.name)
		queue_free()

func _idle(body: Node2D):
	if body == null:
		queue_free()
