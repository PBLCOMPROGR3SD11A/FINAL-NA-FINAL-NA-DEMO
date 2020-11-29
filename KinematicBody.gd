extends KinematicBody

var gravity = -9.8
var velocity = Vector3(0,0,0)
var camera
var ismoving = false 

const SPEED = 100
const ACCELERATION = 70
const DE_ACCELERATION = 60


func _ready():
	pass

func _physics_process(_delta):
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		velocity.x = 0
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		ismoving = true
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		ismoving = true
	else:
		velocity.x = 0
		ismoving = false
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		velocity.z = 0
	elif Input.is_action_pressed("ui_up"):
		velocity.z = -SPEED
		ismoving = true
	elif Input.is_action_pressed("ui_down"):
		velocity.z = SPEED
		ismoving = true
	else:
		velocity.z = 0
	velocity = velocity.normalized() * SPEED
	velocity = move_and_slide(velocity, Vector3.UP)
	
