extends CanvasLayer

func _on_restart_pressed():
	GameCore.Health = GameCore.default_health
	GameCore.Gold = GameCore.default_gold
	get_tree().change_scene_to_file("res://Game.tscn")

func _on_quit_pressed():
	get_tree().quit()

@onready var lose_audio = $Lose_Music
@onready var win_audio = $Win_Music
func _ready():
	#check if health has reached 0
	if GameCore.Health <= 0:
		lose_audio.play()
		$Panel/Stage.text = "You Lose"
	#check if winstate is 1
	elif GameCore.WinState >= 1:
		win_audio.play()
		$Panel/Stage.text = "You Win"
