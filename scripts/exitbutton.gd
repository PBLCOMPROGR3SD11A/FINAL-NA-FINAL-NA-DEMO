extends Button
signal exitButton

func _ready():
	pass 
func _on_StartGame_pressed():
	emit_signal("exitButton")
func _physics_process(delta):
	pass

func _on_play_continueButton():
	pass
func _on_exit_exitButton():
	pass # Replace with function body.
