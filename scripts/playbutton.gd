extends Button
signal playButton

func _ready():
	pass 
func _on_StartGame_pressed():
	emit_signal("playButton")
func _physics_process(delta):
	pass

func _on_play_continueButton():
	pass


func _on_play_mouse_entered():
	pass # Replace with function body.
