extends Control

func _ready():
	reset_timer()
	pass
	
func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://Levels/mainLevel.tscn")

func _on_quit_button_pressed():
	get_tree().quit()

var seconds
var minutes
var default_seconds=0
var default_minutes=3
var show_min
var show_sec

func reset_timer():
	seconds = default_seconds;
	minutes = default_minutes;


func _on_timer_timeout():
	if seconds==0:
		if minutes>0:
			minutes-=1
			seconds=60
	seconds-=1
	if(minutes<10):
		show_min = "0"+str(minutes)
	else:
		show_min = str(minutes)
	if(seconds<10):
		show_sec = "0"+str(seconds)
	else:
		show_sec = str(seconds)
	$Timer/TimerLabel.text=show_min+":"+show_sec

	
