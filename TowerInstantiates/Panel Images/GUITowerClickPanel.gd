extends Panel

@onready var tower = preload("res://TowerInstantiates/TowerModel.tscn")
var tempTower = null
var dragging = false

func _on_gui_input(event):
	# Check if gold is above 100 then allow drag and drop towers
	if GameCore.Gold >= 100:
		# Mouse Button Down - Begin Drag
		if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			print("LeftBtnDown")
			# Instantiate a tower only if we start dragging (i.e., left click down)
			tempTower = tower.instantiate()
			add_child(tempTower)
			tempTower.process_mode = Node.PROCESS_MODE_DISABLED
			tempTower.global_position = get_global_mouse_position()
			dragging = true
		
		# Mouse Movement - Dragging
		elif event is InputEventMouseMotion and dragging:
			# Update the position of the tower to follow the mouse
			if tempTower:
				tempTower.global_position = get_global_mouse_position()

		# Mouse Button Up - End Drag
		elif event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			print("LeftBtnUp")
			if tempTower:
				var path = get_tree().get_root().get_node("mainGame/Towers")
				
				# Manually adjust for the offset when setting the tower's position
				var adjusted_position = get_global_mouse_position() - Vector2(450, 0)  # Adjusting 450px to the left
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
