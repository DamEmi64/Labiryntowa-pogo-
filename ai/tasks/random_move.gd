@tool
extends BTAction

@export var time:float = 1.0
## Variable that stores desired speed (float)
@export var speed: float = 1.0

@export var node_var: NodePath

## left down corner of movement placement
@export var LDVector: Vector3

@export var tolerance := 5.0

## right up corner of movement placement
@export var RUVector: Vector3

var pos: Vector3
var timer = 0.0

func _generate_name() -> String:
	return "Random move "

func _setup() -> void:
	pos = agent.get_node(node_var).global_position


func _tick(_delta: float) -> Status:
	
	if timer == time:
		return SUCCESS
		
	var rng = RandomNumberGenerator.new()
	var node = agent.get_node(node_var)
	if node.global_position.distance_to(pos) < tolerance:
		pos = Vector3()
		pos.y = node.global_position.y
		pos.x = rng.randf_range(LDVector.x,RUVector.x)
		pos.z = rng.randf_range(LDVector.z,RUVector.z)
		
	#var velocity = (target.global_position - node.global_position).normalized()
	#node.move_and_collide(velocity*speed*_delta)
	
	node.move_pathfind(pos)
	return RUNNING
