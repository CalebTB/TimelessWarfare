extends CharacterBody2D


var target
@export var speed = 200
var pathName = ""
var bulletDmg

#Replace "replace later" with the Path Finding Node destination

func _physics_process(delta):
	var pathSpawnerNode = get_tree().get_root().get_node("mainGame/SpawnerPoint")
	for i in pathSpawnerNode.get_child_count():
		if pathSpawnerNode.get_child(i).name == pathName:
			var potentialTarget = pathSpawnerNode.get_child(i).get_child(0).get_child(0)
			if potentialTarget != null:  # Check if the target node is not null
				target = potentialTarget.global_position
				break  # Exit the loop once the target is found
	if target != null:  # Ensure target is not null before proceeding
		velocity = global_position.direction_to(target) * speed
		look_at(target)
		move_and_slide()
	

#whenever it hits the enemy then its loses health.
func _on_area_2d_body_entered(body):
	if "Bug1" in body.name:
		body.Health -= bulletDmg
		queue_free()
