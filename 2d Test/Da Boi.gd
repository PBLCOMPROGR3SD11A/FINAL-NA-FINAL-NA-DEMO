extends KinematicBody2D

const UP = Vector2(0,-1)
const FLAP = 200
const MAXFALLSPEED = 200
const GRAVITY = 10


var motion = Vector2()
var Wall = preload("res://Player Node/Wall-E.tscn") 
var score = 0

func _ready():
	pass 

func _physics_process(delta):
	
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	if Input.is_action_just_pressed("FLAP"):
		motion.y = -FLAP
	
	motion = move_and_slide(motion, UP)

func _on_Detect_body_entered(body):
	if body.name == "Walls":
		get_tree().reload_current_scene()
