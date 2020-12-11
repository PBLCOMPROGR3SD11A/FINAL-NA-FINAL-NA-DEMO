
extends KinematicBody

var gravity = 100
var Nyx = Vector3()
# var velocity = Vector3(0,0,0)
var velocity = local_direction * SPEED
var local_direction = global_direction.rotated(vector3(0,1,0),rotation.y)
var camera
var ismoving = false 
var global_direction = Vector3(0,0,1)


const SPEED = 80
const ACCELERATION = 50
const DE_ACCELERATION = 40


func _ready():
	pass

func _physics_process(_delta):
	#movement toh
	if not is_on_floor():
		Nyx.y -= gravity * _delta
	move_and_slide(Nyx, Vector3.UP)
	#move_and_slide(Nyx, Vector3.DOWN)
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		velocity.x = 0
		ismoving = false
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		set_rotation_degrees(Vector3(0,90,0))
		ismoving = true
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		set_rotation_degrees(Vector3(0,-90,0))
		ismoving = true
	else:
		velocity.x = 0
		ismoving = false
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		velocity.z = 0
	elif Input.is_action_pressed("ui_up"):
		velocity.z = -SPEED
		set_rotation_degrees(Vector3(0,180,0))
		ismoving = true
	elif Input.is_action_pressed("ui_down"):
		velocity.z = SPEED
		set_rotation_degrees(Vector3(0,0,0))
		ismoving = true
	else:
		velocity.z = 0
	velocity = velocity.normalized() * SPEED
	move_and_slide(velocity, Vector3.UP)
	
