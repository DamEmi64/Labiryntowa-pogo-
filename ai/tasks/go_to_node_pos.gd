@tool
extends BTAction

@export var speed: float = 1.0

## How close should the agent be to the target position to return SUCCESS.
@export var tolerance := 5.0

@export var target_var: NodePath

@export var node_var: NodePath

var pos:Vector3

var timer = 0.0

func _generate_name() -> String:
	return "Go to  " + target_var.get_name(0) + " position"

# Called to initialize the task.
func _setup() -> void:
	pos = agent.get_node(target_var).global_position

func _tick(_delta: float) -> Status:	
	var node = agent.get_node(node_var)
	if node.global_position.distance_to(pos) < tolerance:
		return SUCCESS
		
	#var velocity = (target.global_position - node.global_position).normalized()
	#node.move_and_collide(velocity*speed*_delta)
	
	node.move_pathfind(pos)
	return RUNNING
