extends Node2D

@onready var button_2: Button = %Button2
@onready var button_3: Button = %Button3
@onready var button: Button = %Button
@onready var l_1_locked: ColorRect = $L1_locked
@onready var l_2_locked: ColorRect = $L2_locked
@onready var l_3_locked: ColorRect = $L3_locked



func _ready() -> void:
	button.grab_focus()

	#level 1 code
	#https://www.youtube.com/watch?v=eTYaSU6ZNi0 @20.45
	if LevelCore.lvl1_completed == true:
		l_1_locked.visible = false
	if LevelCore.lvl1_completed == false:
		l_1_locked.visible =true

	#level 2 code
	if LevelCore.lvl2_completed == true:
		l_2_locked.visible = false
	if LevelCore.lvl2_completed == false:
		l_2_locked.visible =true

	#level 3 code
	if LevelCore.lvl3_completed == true:
		l_3_locked.visible = false
	if LevelCore.lvl3_completed == false:
		l_3_locked.visible =true


func _on_button_pressed() -> void:
	if LevelCore.lvl1_completed == false:
		get_tree().change_scene_to_file("res://levels/2.tscn")
	else:
		get_tree().change_scene_to_file("res://levels/2.tscn")


func _on_button_2_pressed() -> void:
	if LevelCore.lvl1_completed == false:
		null
	if LevelCore.lvl1_completed == true:
		get_tree().change_scene_to_file("res://levels/3.tscn")


func _on_button_3_pressed() -> void:
	if LevelCore.lvl2_completed == false:
		null
	if LevelCore.lvl2_completed == true:
		get_tree().change_scene_to_file("res://levels/4.tscn")
