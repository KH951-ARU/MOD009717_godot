extends StaticBody2D
#varibles 
#main vars
@export var Spell : PackedScene = preload("res://General Assets/Towers/Towers/Towers scenes/attacksfx paliden.tscn")
var SpellDamage = 5
var tracePath
var currentTarget = []
var current
@export var spellcontainer : Node
@onready var sprite = get_node('palidien')
@export var spriteholder : AnimatedSprite2D
@export var towers : Area2D
var range = 200
var projectileSpeed = 50

#functions
func _ready() -> void:
	spriteholder.play("idle")
	

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
		tempSpell.speed += projectileSpeed
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
		get_node("Upgrades/Upgrades").global_position = self.position + Vector2(0,0)


func _on_range_pressed() -> void:
	range += 50
	print(range)


func _on_attack_speed_pressed() -> void:
	projectileSpeed += 50 
	print (projectileSpeed)


func _on_power_pressed() -> void:
	SpellDamage += 5
	print(SpellDamage) 

func update_Upgrade_pannel():
	get_node("Upgrades/Upgrades/HBoxContainer/Range/RichTextLabel").text = str("[fade start=0 length 5][color=aqua][wave amp =50 freq =2][fill]"+ str(range) +"[/fill][/wave][/color][/fade]")
	get_node("Upgrades/Upgrades/HBoxContainer/Range/RichTextLabel2").text = str("[fade start=0 length 5][color=aqua][wave amp =50 freq =2][fill]"+str(projectileSpeed)+"[/fill][/wave][/color][/fade]")
	get_node("Upgrades/Upgrades/HBoxContainer/Range/RichTextLabel3").text = str("[fade start=0 length 5][color=aqua][wave amp =50 freq =2][fill]"+str(SpellDamage)+"[/fill][/wave][/color][/fade]")
	
	get_node("palidien/Tower/CollisionShape2D").shape.radius = range

func _on_range_mouse_entered() -> void:
	get_node("palidien/Tower/CollisionShape2D").show()

func _on_range_mouse_exited() -> void:
	get_node("palidien/Tower/CollisionShape2D").hide()
