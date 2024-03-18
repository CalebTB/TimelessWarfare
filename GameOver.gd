extends CanvasLayer

func _on_restart_pressed():
	GameCore.Health = 100
	GameCore.Gold = 500
	get_tree().change_scene_to_file("res://Game.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _ready():
	#check if health has reached 0
	if GameCore.Health <= 0:
		$Panel/Stage.text = "You Lose"
	#check if winstate is 1
	elif GameCore.WinState >= 1:
		$Panel/Stage.text = "You Win"
