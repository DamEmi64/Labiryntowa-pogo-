@tool
extends BTAction

@export var time:float = 1.0
## Variable that stores desired speed (float)
@export var speed: float = 1.0

## How close should the agent be to the target position to return SUCCESS.
@export var tolerance_for_chase: float = 1.0

@export var target_var: NodePath

@export var node_var: NodePath

var timer = 0.0
var node
var target

func _setup() -> void:
	target = agent.get_node(target_var)
	node = agent.get_node(node_var)

func _generate_name() -> String:
	return "Chase " + target_var.get_name(0)

func _tick(_delta: float) -> Status:
	
	if timer == time:
		timer = 0
		node.chasing = false
		return SUCCESS
	timer +=1
	
	node.chasing = true
	if node.global_position.distance_to(target.global_position) < tolerance_for_chase:
		timer = 0
		node.chasing = false
		return SUCCESS
		
	#var velocity = (target.global_position - node.global_position).normalized()
	#node.move_and_collide(velocity*speed*_delta)
	
	node.move_pathfind(target.global_position)
	return RUNNING
