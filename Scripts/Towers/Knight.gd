extends StaticBody2D

@export var Spell : PackedScene
var SpellDamage = 5
var tracePath
var currentTarget = []
var current
@export var spellcontainer : Node
@onready var sprite = get_node('Knight')
@export var spriteholder : AnimatedSprite2D
@export var towers : Area2D

func _ready() -> void:
	spriteholder.play("Idle")
	

func _process(delta: float) -> void:
	pass

func _on_tower_body_entered(body):
	if body is Enemy  :
		#var tempArray = []
		#
		#currentTarget = get_tree().get_nodes_in_group("tower")
		#for tower in currentTarget:
			#tower = towers.get_overlapping_bodies()
		#for i in currentTarget:
				#tempArray.append(body)
		#currentTarget = null
		#
		#for i in tempArray:
			#if currentTarget == null:
				#currentTarget = i.get_node("../")
			#else:
				#if i.get_parent().get_progress > currentTarget.get_progress():
					#currentTarget = i.get_node("../")
		currentTarget = body
		
		
		current = currentTarget
		tracePath = currentTarget
		
		spriteholder.play("RangedAttack")
		var tempSpell = Spell.instantiate()
		tempSpell.tracePath = tracePath
		tempSpell.SpellDamage = SpellDamage
		tempSpell.target = currentTarget
		spellcontainer.call_deferred("add_child",tempSpell)
		tempSpell.global_position = $Aim.global_position

func _on_tower_body_exited(body: Node2D):
	#currentTarget = towers.get_overlapping_bodies()
	#if currentTarget != towers.get_overlapping_bodies():
		#return
	await spriteholder.animation_finished
	spriteholder.play("Idle")
	pass
