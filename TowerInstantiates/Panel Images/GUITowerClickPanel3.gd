extends Panel


@onready var tower = preload("res://TowerInstantiates/TowerModel3.tscn")
var currTile
var tempTower = null
var dragging = false

func _on_gui_input(event):
	#If gold is above 350 then you can drag and drop towers
	if GameCore.Gold >= 350:
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
			get_child(1).queue_free()
			var path = get_tree().get_root().get_node("mainGame/Towers")
			
			path.add_child(tempTower)
			tempTower.global_position = event.global_position
			tempTower.get_node("Area").hide()
			GameCore.Gold -= 350
