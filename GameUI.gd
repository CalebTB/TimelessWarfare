extends Control



func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://Levels/mainLevel.tscn")

func _on_quit_button_pressed():
	get_tree().quit()
