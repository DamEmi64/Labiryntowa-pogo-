@tool
extends BTAction

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
	
	if node.chasing:
		return SUCCESS
	
	if ray3d == null:
		return RUNNING
	
	for enemy in agent.get_tree().get_nodes_in_group("enemy"):
		ray3d.add_exception(enemy)
	for world in agent.get_tree().get_nodes_in_group("world"):
		ray3d.add_exception(world)
		
	if time_for_detect != 0 and time_for_detect == timer:
		return FAILURE
	timer+=1
	
	if ray3d.is_colliding() and ray3d.get_collider() == target:
		return SUCCESS
	
	return RUNNING
