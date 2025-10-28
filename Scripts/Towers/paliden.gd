extends StaticBody2D

@export var Spell : PackedScene
var SpellDamage = 5
var tracePath
var currentTarget = []
var current
@onready var sprite = get_node('palidien')
@export var spriteholder : AnimatedSprite2D
@export var towers : Area2D

func _ready() -> void:
	spriteholder.play("idle")

func _on_tower_body_entered(body: Node2D):
	if body is Enemy  :
		var tempArray = []
		#currentTarget = get_node("Tower").get_overlapping_bodies()
		currentTarget = get_tree().get_nodes_in_group("tower")
		for tower in currentTarget:
			tower = towers.get_overlapping_bodies()
		for i in currentTarget:
			if Enemy in i.name:
				tempArray.append(1)
		currentTarget = null
		
		for i in tempArray:
			if currentTarget == null:
				currentTarget = i.get_node("../")
			else:
				if i.get_parent().get_progress > currentTarget.get_progress():
					currentTarget = i.get_node("../")
		current = currentTarget
		tracePath = currentTarget.get_parent().name
		
		spriteholder.play("RangedAttack")
		var tempSpell = Spell.instantiate()
		tempSpell.tracePath = tracePath
		tempSpell.SpellDamage = SpellDamage
		get_node("spellcontainer").add_child(tempSpell)
		tempSpell.global_position = $Aim.global_position

func _on_tower_body_exited(body: Node2D):
	pass # Replace with function body.
