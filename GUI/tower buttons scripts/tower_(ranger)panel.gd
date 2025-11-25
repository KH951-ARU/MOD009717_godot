extends Panel
@export var tower1 :PackedScene
var currentTile
var tempTower
var onscreen : bool = false
var PathMap
var Isotile
func _on_gui_input(event):

	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed: #left click down
		tempTower = tower1.instantiate()
		
		print("left button down")
		add_child(tempTower)


		tempTower.scale = Vector2(0.75,0.75) # scale for the tower

	elif event is InputEventMouseMotion:
		if tempTower and is_instance_valid(tempTower):
			tempTower.global_position = event.global_position
			print("dragging")
			
			PathMap = get_tree().get_root().find_child("tower objection",true, false) as TileMapLayer
			Isotile = PathMap.local_to_map(get_global_mouse_position())
			currentTile = PathMap.get_cell_atlas_coords(Isotile)
			if (currentTile == Vector2i(11,9)or Vector2i(11,10) or Vector2i(15,8) or Vector2i(15,9) or Vector2i(15,10)):
				tempTower.get_node("Area").modulate = Color8(49,91,92,255)
			else:
				tempTower.get_node("Area").modulate = Color8(255,0,0,145)

	elif  event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.pressed: #left click up
		print("left button up")

		var dropPOS = get_tree().get_root().get_node("Level 1").get_global_mouse_position() # place location
		if event.global_position.x >= 1655:
			tempTower.queue_free()
		else:
			remove_child(tempTower)
			if (currentTile == Vector2i(11,9)or Vector2i(11,10) or Vector2i(15,8) or Vector2i(15,9) or Vector2i(15,10)):
				var Towerpath = get_tree().get_root().get_node("Level 1/Tower")
				Towerpath.add_child(tempTower)
				tempTower.global_position = dropPOS
				tempTower.get_node("Area").hide()
		tempTower = null
	#else:
		#if get_child_count() > 1:
			#get_child(1).queue_free()
 
