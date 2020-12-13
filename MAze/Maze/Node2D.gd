extends Node2D

var game_timer = null
export var game_time = 45

func _ready():
	game_timer = Timer.new()
	game_timer.set_wait_time(game_time)
	game_timer.set_one_shot(true)
	game_timer.connect("timeout", self, "_timeout")
	add_child(game_timer)
	game_timer.start()

func _timeout():
	$lose.visible = true
	get_tree().paused = true



func _on_Area2D_body_entered(body):
	$win.visible = true
	get_tree().paused = true
