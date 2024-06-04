@tool
extends BTAction

@export var time:float = 1.0
## Variable that stores desired speed (float)
@export var speed: float = 1.0

@export var node_var: NodePath

@export var tolerance := 5.0


var pos: Vector3
var timer = 0.0
var rng

func _generate_name() -> String:
	return "Random move" 

func _setup() -> void:
	rng = RandomNumberGenerator.new()

func _tick(_delta: float) -> Status:
	
	if time != 0 and timer == time:
		timer = 0
		pos = Vector3()
		pos.y = 0
		pos.x = rng.randf_range(0,1000)
		pos.z = rng.randf_range(0,1000)
		
	timer +=1	
	
	var node = agent.get_node(node_var)	
	#var velocity = (target.global_position - node.global_position).normalized()
	#node.move_and_collide(velocity*speed*_delta)
	
	node.move_pathfind(pos)
	return RUNNING
