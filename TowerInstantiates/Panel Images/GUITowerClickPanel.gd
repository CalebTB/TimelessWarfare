extends Panel


@onready var tower = preload("res://TowerInstantiates/TowerModel.tscn")
var currTile

func _on_gui_input(event):
	#If gold is above 100 then you can drag and drop towers
	if GameCore.Gold >= 100:
	#------------------------------------------------------
		var tempTower = tower.instantiate()
		#Left Click Down
		if event is InputEventMouseButton and event.button_mask == 1:
			print("LeftBtnDown")
			add_child(tempTower)
			tempTower.process_mode = Node.PROCESS_MODE_DISABLED
			
		#Left click Drag
		elif event is InputEventMouseButton and event.button_mask == 1:
			get_child(1).global_position = event.global_position
			
		#Left Click Up
		elif event is InputEventMouseButton and event.button_mask == 0:
			print("LeftBtnUp")
			if tempTower:
				var path = get_tree().get_root().get_node("mainGame/Towers")
				
				# Manually adjust for the offset when setting the tower's position
				var adjusted_position = get_global_mouse_position() - Vector2(0, 0)
				var local_position = path.to_local(adjusted_position)
				
				tempTower.get_parent().remove_child(tempTower)
				path.add_child(tempTower)
				tempTower.global_position = local_position
				tempTower.process_mode = Node.PROCESS_MODE_INHERIT
				tempTower.get_node("Area").hide()
				
				GameCore.Gold -= 100
				
				# Reset dragging state and temporary tower reference
				dragging = false
				tempTower = null
