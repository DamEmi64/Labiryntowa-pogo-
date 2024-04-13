@tool
extends BTAction

@export var scene_path: String
@export var player_var: NodePath

func _generate_name() -> String:
	return "change scene to " + scene_path

func _tick(_delta: float) -> Status:
	var player = agent.get_node(player_var)
	agent.get_tree().change_scene_to_file(scene_path)
	##agent.get_tree().current_scene.add_child(player)
	return SUCCESS
