extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player = get_parent_node_3d().get_node("player")
	if player != null and player.can_move and global_position.distance_to(player.global_position) < 1:
		Global.points += 1
		queue_free()
	pass
