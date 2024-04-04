@tool
extends BTAction

@export var speed: float = 1.0

## How close should the agent be to the target position to return SUCCESS.
@export var tolerance := 5.0

@export var pos:Vector3

@export var node_var: NodePath

var timer = 0.0

func _generate_name() -> String:
	return "Go to position"

# Called to initialize the task.


func _tick(_delta: float) -> Status:	
	var node = agent.get_node(node_var)
	if node.global_position.distance_to(pos) < tolerance:
		return SUCCESS
		
	#var velocity = (target.global_position - node.global_position).normalized()
	#node.move_and_collide(velocity*speed*_delta)
	
	node.move_pathfind(pos)
	return RUNNING
