extends BTAction

@export var from_var: NodePath
@export var to_var : NodePath
@export var tp : String
@export var move_player_before : Vector3

func _generate_name() -> String:
	return  "teleport map " + from_var.get_name(0) + " >> " +  to_var.get_name(0)

func _tick(_delta: float) -> Status:
	var player = agent.get_node(from_var).get_node("player")
	if player != null:
		var teleport = agent.get_node(from_var).get_node(tp)
		if teleport != null:
			if  player.global_position.distance_to(teleport.global_position) < 1:
				if player.can_move:
					var old_player = agent.get_node(from_var).get_node("player")
					old_player.global_position = old_player.global_position + move_player_before
					old_player.can_move = false
					agent.get_node(to_var).teleport()
	return RUNNING
	
