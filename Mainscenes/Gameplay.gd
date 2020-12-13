extends Node2D

const window_size = Vector2(500, 700)
var location = Vector2()
var meteor_timer = null
export var meteor_time = 2.5
var spawn_meteor = true
var packed_scene = [preload("res://MEteor/MEteorBIg.tscn")]
var game_timer = null
export var game_time = 25

func _ready():
	meteor_timer = Timer.new()
	meteor_timer.set_wait_time(meteor_time)
	meteor_timer.set_one_shot(true)
	meteor_timer.connect("timeout", self, "on_timeout_complete")
	add_child(meteor_timer)
	meteor_timer.start()
	game_timer = Timer.new()
	game_timer.set_wait_time(game_time)
	game_timer.set_one_shot(true)
	game_timer.connect("timeout", self, "on_game_timeout_complete")
	add_child(game_timer)
	game_timer.start()
	
	
func on_timeout_complete():
	spawn_meteor = true

func on_game_timeout_complete():
	$win.visible = true
	get_tree().paused = true

func _process(_delta):
	randomize()
	var x = randi() % packed_scene.size()
	location.x = rand_range(1, window_size.x)
	location.y = 10
	if (spawn_meteor):
		var scene = packed_scene[x].instance()
		scene.position = location
		add_child(scene)
		spawn_meteor = false
		meteor_timer.start()
		
	if GlobalVars.player_dead == true:
		$lose.visible = true
		get_tree().paused = true
		
		

