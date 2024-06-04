extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("player").can_move = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func teleport():
	get_node("Camera3D").make_currnt()
