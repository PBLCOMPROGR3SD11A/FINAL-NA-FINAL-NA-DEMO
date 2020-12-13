tool

extends Area

export(String, FILE) var next_scene_path = ""

func _get_configuration_warning() -> String:
	if next_scene_path == "":
		return "next_scene_path must be set for the door to let you through"
	else:
		return ""

#func _on_Door_body_entered(body):
	#get_tree().change_scene(next_scene_path) != OK:
