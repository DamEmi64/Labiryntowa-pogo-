extends MeshInstance3D

var timer = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if timer> 0:
		timer-=1
	
	pass

func activate_timer():
	timer = 1000
