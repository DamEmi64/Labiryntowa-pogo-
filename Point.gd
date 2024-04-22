extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var player = get_node("/root/"+get_tree().current_scene.name+"/player")
	if global_position.distance_to(player.global_position) < 1:
		Global.points += 1
		queue_free()
	pass
