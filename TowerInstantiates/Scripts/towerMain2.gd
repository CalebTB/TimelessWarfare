extends Node2D

@export var Arrow = preload("res://TowerInstantiates/Arrow2.tscn")
@export var bulletDmg = 25 
var pathName
var currTargets = []
var curr

#Replace Soldier with actual names of Soldiers
#Soldier A is the name of the example video posted in Chat so whatever Node name we give our enemies then replace it with that

#makes sure the bullets disappeat after that hit their target
func _process(delta):
	if is_instance_valid(curr):
		self.look_at(curr.global_position)
	else:
		for i in get_node("BulletContainer").get_child_count():
			get_node("BulletContainer").get_child(i).queue_free()

#Checks when the enemy is inside the Attack radius and shoots, so adjust that for the radius
func _on_tower_body_entered(body):
	if "Bug1" in body.name:
		var tempArray = []
		currTargets = get_node("Tower").get_overlapping_bodies()
		
		for i in currTargets:
			if "Bug" in i.name:
				tempArray.append(i)
				
		var currTarget = null
	
		for i in tempArray:
			if currTarget == null:
				currTarget = i.get_node("../")
			else:
				if i.get_parent().get_progress() > currTarget.get_progress():
					currTarget = i.get_node("../")
	
		curr = currTarget
		pathName = currTarget.get_parent().name
		
		var tempBullet = Arrow.instantiate()
		tempBullet.pathName = pathName
		tempBullet.bulletDmg = bulletDmg
		get_node("BulletContainer").add_child(tempBullet)
		tempBullet.global_position = $Aim.global_position
	

func _on_tower_body_exited(body):
	currTargets = get_node("Tower").get_overlapping_bodies()
