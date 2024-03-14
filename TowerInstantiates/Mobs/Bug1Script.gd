extends CharacterBody2D


@export var speed = 50
var Health = 20
func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed*delta)
	if get_parent().get_progress_ratio() == 1:
		death()
		GameCore.Health -= 1
		
	if Health <= 0:
		death()
		GameCore.Gold += 20

func death():
	get_parent().get_parent().queue_free()
