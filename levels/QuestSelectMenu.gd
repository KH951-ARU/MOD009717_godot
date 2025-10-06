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
	#https://www.youtube.com/watch?v=eTYaSU6ZNi0 @16.22
	if LevelCore.lvl1_completed == true:
		l_1_locked.visible = false
	if LevelCore.lvl1_completed == false:
		l_1_locked.visible =true
