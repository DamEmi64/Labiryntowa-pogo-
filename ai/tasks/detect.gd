@tool
extends BTAction

## How close should the agent be to the target position to return SUCCESS.
@export var tolerance := 5.0

@export var target_var: NodePath

@export var node_var: NodePath

@export var time_for_detect: int

var timer :int = 0

func _generate_name() -> String:
	return "Detect " + target_var.get_name(0);
	
func _tick(_delta: float) -> Status:	
	var node = agent.get_node(node_var)
	var target = agent.get_node(target_var)
	var ray3d : RayCast3D = node.rayCast
	
	if time_for_detect != 0 and time_for_detect == timer:
		return FAILURE
	timer+=1
	
	if ray3d.is_colliding() and ray3d.get_collider() == target:
		return SUCCESS
	
	return RUNNING
