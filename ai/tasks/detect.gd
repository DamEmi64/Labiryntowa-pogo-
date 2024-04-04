@tool
extends BTAction

## How close should the agent be to the target position to return SUCCESS.
@export var tolerance := 5.0

@export var target_var: NodePath

@export var node_var: NodePath

func _generate_name() -> String:
	return "Detect " + target_var.get_name(0)

# Called to initialize the task

func _tick(_delta: float) -> Status:	
	var node = agent.get_node(node_var)
	var target = agent.get_node(target_var)
	var ray3d : RayCast3D = node.rayCast
	
	if ray3d.is_colliding() && ray3d.get_collider() == target:
		return SUCCESS
	
	return RUNNING
