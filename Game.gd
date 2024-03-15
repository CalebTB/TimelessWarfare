extends Node2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GameCore.Health <= 0:
		GameCore.Health = 100
		GameCore.Gold = 500
		get_tree().change_scene_to_file("res://GameOver.tscn")

