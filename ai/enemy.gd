extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var nav_agent = $NavigationAgent3D
@onready var rayCast = $RayCast3D
@onready var timer = 0
var chasing: bool = false

func _ready():
	add_to_group("enemy")
	pass

func _physics_process(delta):
	timer+=1
	var player = get_node("/root/"+get_tree().current_scene.name+"/player")
	if player.global_position.distance_to(global_position) < 1.5 and timer > 100:
		Global.lifes -=1
		timer = 0
	pass
	#rotate(rayCast.target_position,0.01)

func move_pathfind(target_locaction):
	set_physics_process(false)
	await get_tree().physics_frame
	set_physics_process(true)
	nav_agent.target_position = target_locaction
	var target = nav_agent.get_next_path_position()
	var direction = (target - global_position).normalized() * SPEED
	velocity = velocity.lerp(direction,0.05)
	var lookdir = atan2(-velocity.x, -velocity.z)
	rotation.y = lookdir
	move_and_slide()
