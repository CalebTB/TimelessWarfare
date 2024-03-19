extends Node2D

#preload all paths
@onready var path = preload("res://TowerInstantiates/Mobs/Round1.tscn")
@onready var path1 = preload("res://TowerInstantiates/Mobs/Round4.tscn")
@onready var path2 = preload("res://TowerInstantiates/Mobs/Round5.tscn")
@onready var path3 = preload("res://TowerInstantiates/Mobs/Round6.tscn")
@onready var path4 = preload("res://TowerInstantiates/Mobs/Round7.tscn")
@onready var path5 = preload("res://TowerInstantiates/Mobs/Round8.tscn")
@onready var path6 = preload("res://TowerInstantiates/Mobs/Round9.tscn")
@onready var path7 = preload("res://TowerInstantiates/Mobs/Round10.tscn")
@onready var path8 = preload("res://TowerInstantiates/Mobs/Round11.tscn")
@onready var path9 = preload("res://TowerInstantiates/Mobs/Round12.tscn")
@onready var path10 = preload("res://TowerInstantiates/Mobs/Round13.tscn")
@onready var path11 = preload("res://TowerInstantiates/Mobs/Round14.tscn")
@onready var path12 = preload("res://TowerInstantiates/Mobs/Round15.tscn")
@onready var path13 = preload("res://TowerInstantiates/Mobs/Round16.tscn")
@onready var path14 = preload("res://TowerInstantiates/Mobs/Round17.tscn")
@onready var path15 = preload("res://TowerInstantiates/Mobs/Round18.tscn")
@onready var path16 = preload("res://TowerInstantiates/Mobs/Round19.tscn")
@onready var path17 = preload("res://TowerInstantiates/Mobs/Round20.tscn")
@onready var path18 = preload("res://TowerInstantiates/Mobs/Round21.tscn")
@onready var path19 = preload("res://TowerInstantiates/Mobs/Round22.tscn")

func _on_timer_timeout():
	
	#generate 9 gold every one second
	await get_tree().create_timer(1).timeout
	GameCore.Gold += 9
	
	#generate new paths every 15 seconds
	var tempPath = path.instantiate()
	add_child(tempPath)
	await get_tree().create_timer(15).timeout
	var tempPath1 = path1.instantiate()
	add_child(tempPath1)
	await get_tree().create_timer(15).timeout
	var tempPath2 = path2.instantiate()
	add_child(tempPath2)
	await get_tree().create_timer(15).timeout
	var tempPath3 = path3.instantiate()
	add_child(tempPath3)
	await get_tree().create_timer(15).timeout
	var tempPath4 = path4.instantiate()
	add_child(tempPath4)
	await get_tree().create_timer(15).timeout
	var tempPath5 = path5.instantiate()
	add_child(tempPath5)
	await get_tree().create_timer(15).timeout
	var tempPath6 = path6.instantiate()
	add_child(tempPath6)
	await get_tree().create_timer(15).timeout
	var tempPath7 = path7.instantiate()
	add_child(tempPath7)
	await get_tree().create_timer(15).timeout
	var tempPath8 = path8.instantiate()
	add_child(tempPath8)
	await get_tree().create_timer(15).timeout
	var tempPath9 = path9.instantiate()
	add_child(tempPath9)
	await get_tree().create_timer(15).timeout
	
	
	#double all paths 
	var tempPath10 = path10.instantiate()
	add_child(tempPath10)
	var tempPath11 = path11.instantiate()
	add_child(tempPath11)
	var tempPath12 = path12.instantiate()
	add_child(tempPath12)
	var tempPath13 = path13.instantiate()
	add_child(tempPath13)
	var tempPath14= path14.instantiate()
	add_child(tempPath14)
	var tempPath15 = path15.instantiate()
	add_child(tempPath15)
	var tempPath16 = path16.instantiate()
	add_child(tempPath16)
	var tempPath17 = path17.instantiate()
	add_child(tempPath17)
	var tempPath18 = path18.instantiate()
	add_child(tempPath18)
	var tempPath19 = path19.instantiate()
	add_child(tempPath19)
	
	#genrate win after surviving 30 seconds of double time
	await get_tree().create_timer(30).timeout
	GameCore.WinState += 1
