extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("FirstWall/player").can_move = true
	get_node("SecondWall/player").can_move = false
	get_node("ThirdWall/player").can_move = false
	get_node("FourthWall/player").can_move = false
	get_node("FifthWall/player").can_move = false
	get_node("SixWall/player").can_move = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
