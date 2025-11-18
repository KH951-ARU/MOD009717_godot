extends StaticBody2D

@export var Spell : PackedScene = preload("res://General Assets/Towers/Towers/Towers scenes/attacksfx Ranger.tscn")
var SpellDamage = 5
var tracePath
var currentTarget = []
var current
@export var spellcontainer : Node
@onready var sprite = get_node('Ranger')
@export var spriteholder : AnimatedSprite2D
@export var towers : Area2D

func _ready() -> void:
	spriteholder.play("Idle")
	

func _process(delta: float) -> void:
	pass

func _on_tower_body_entered(body):
	tracePath = body
	print("enemry entered")
	print(body)
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

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void: #click down on upgrade button
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		var towerpath = get_tree().get_root().get_node("Level 1/Tower")
		for i in towerpath.get_child_count():
			if towerpath.get_child(i).name != self.name:
				towerpath.get_child(i).get_node("Upgrades/Upgrades").hide()
		get_node("Upgrades/Upgrades").visible = !get_node("Upgrades/Upgrades").visible
		get_node("Upgrades/Upgrades").global_position = self.position + Vector2(-572,81)
