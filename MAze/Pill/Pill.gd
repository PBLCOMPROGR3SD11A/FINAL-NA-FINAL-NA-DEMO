extends KinematicBody2D

export var moveSpeed : int = 250

var vel : Vector2 = Vector2()
var facingDir : Vector2 = Vector2()

func _physics_process(delta):
	
	vel = Vector2()
	
	if Input.is_action_pressed("W"):
		vel.y -= 1
		facingDir = Vector2(0, -1)
	if Input.is_action_pressed("S"):
		vel.y += 1
		facingDir = Vector2(0, -1)
	if Input.is_action_pressed("A"):
		vel.x -= 1
		facingDir = Vector2(-1, 0)
	if Input.is_action_pressed("D"):
		vel.x += 1
		facingDir = Vector2(-1, 0)
	
	move_and_slide(vel * moveSpeed)

