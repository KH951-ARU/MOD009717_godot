extends Panel
@onready var tower1 = preload("res://General Assets/Towers/Towers/Towers scenes/Ranger.tscn")
var currentTile
var heldTower
func _on_gui_input(event):
	
	if event is InputEventMouseButton and event.button_mask == 1: #left click down
		var tempTower = tower1.instantiate()
		heldTower = tempTower
		print("left button down")
		add_child(tempTower)
		
		tempTower.process_mode = Node.PROCESS_MODE_DISABLED
		tempTower.scale = Vector2(0.32,0.32)
		
	elif event is InputEventMouseButton and event.button_mask == 1 and heldTower: #drag left click
		get_child(1).global_postition = event.global_postion
		
	elif  event is InputEventMouseButton and event.button_mask == 0: #left click up
		print("left button up")
		if event.global_position.x >= 1655:
			if get_child_count() > 1:
				get_child(1).queue_free()
		else:
			if get_child_count() > 1:
				get_child(1).queue_free()
			var path = get_tree().get_root().get_node("Level 1/Tower")
				
			path.add_child(heldTower)
			heldTower.global_position = event.global_position
			heldTower.get_node("Area").hide()
	else:
		if get_child_count() > 1:
			get_child(1).queue_free()
