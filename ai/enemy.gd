extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var nav_agent = $NavigationAgent3D
@onready var rayCast = $RayCast3D
@onready var timer = 0
var chasing: bool = false

func _physics_process(delta):
	timer+=1
	var player = get_node("/root/"+get_tree().current_scene.name+"/player")
	if player.global_position.distance_to(global_position) < 1 and timer > 100:
		Global.lifes -=1
		timer = 0
	pass

func move_pathfind(target_locaction):
	set_physics_process(false)
	await get_tree().physics_frame
	set_physics_process(true)
	nav_agent.target_position = target_locaction
	var direction = (nav_agent.get_next_path_position() - global_position).normalized() * SPEED
	velocity = velocity.lerp(direction,0.05)  
	rayCast.set_target_position(Vector3(position.x + velocity.x,1,position.z + velocity.z))
	move_and_slide()
