@tool
extends BTAction

@export var scene_path: String
@export var player_var: NodePath
@export var teleport_var: NodePath

var tp = true

func _generate_name() -> String:
	return "change scene to " + scene_path

func _tick(_delta: float) -> Status:
	var player = agent.get_node(player_var)
	player.can_move = false
	
	return SUCCESS
