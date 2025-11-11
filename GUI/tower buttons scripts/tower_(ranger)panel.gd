extends Panel
@export var tower1 :PackedScene
var currentTile

func _on_gui_input(event):
	
	if event is InputEventMouseButton and event.button_mask == 1: #left click down
		var tempTower = tower1.instantiate()
		
		print("left button down")
		add_child(tempTower)
		
		tempTower.process_mode = Node.PROCESS_MODE_DISABLED
		tempTower.scale = Vector2(0.32,0.32)
		
	elif event is InputEventMouseButton and event.button_mask == 1: #drag left click
		get_child(1).global_postition = event.global_postion
		
	elif  event is InputEventMouseButton and event.button_mask == 0: #left click up
		print("left button up")
		var tempTower = tower1.instantiate()
		var dropPOS = get_tree().get_root().get_node("Level 1").get_global_mouse_position # place location
		if event.global_position.x >= 1655:
			if get_child_count() > 1:
				get_child(1).queue_free()
		else:
			if get_child_count() > 1:
				get_child(1).queue_free()
			var Towerpath = get_tree().get_root().get_node("Level 1/Tower")
			Towerpath.add_child(tempTower)
			tempTower.global_position = dropPOS
			tempTower.get_node("Area").hide()
	else:
		if get_child_count() > 1:
			get_child(1).queue_free()
