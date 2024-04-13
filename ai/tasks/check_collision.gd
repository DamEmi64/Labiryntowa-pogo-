@tool
extends BTAction

## How close should the agent be to the target position to return SUCCESS.
@export var tolerance := 5.0

@export var target_var: NodePath

@export var player_var: NodePath

func _generate_name() -> String:
	return "Check collision " + player_var.get_name(0) + " with "+ target_var.get_name(0)

# Called to initialize the task

func _tick(_delta: float) -> Status:	
	var player = agent.get_node(player_var)
	var target = agent.get_node(target_var)
	var distance = player.global_position.distance_to(target.global_position)
	if distance < tolerance:
		return SUCCESS
	
	return RUNNING
