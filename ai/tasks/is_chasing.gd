extends BTAction

@export var node_var: NodePath

func _generate_name() -> String:
	return node_var.get_name(0) + "is in chase mode" 

func _tick(_delta: float) -> Status:
	var node = agent.get_node(node_var)
	if node != null and node.chasing:
		return SUCCESS
	else:
		return FAILURE
