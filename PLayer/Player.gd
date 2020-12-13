extends Area2D

var plBullet := preload("res://BUllet/Bullet.tscn")

onready var sprite := $Sprite

export var speed: float = 150
var vel := Vector2(0, 0)


var timer = null
export var bullet_delay = 0.1
var can_shoot = true

func _ready():
	timer = Timer.new()
	timer.set_one_shot(true) 
	timer.set_wait_time(bullet_delay)
	timer.connect("timeout", self, "on_timeout_complete")
	add_child (timer)
	
func on_timeout_complete():
	can_shoot = true
	
func _physics_process(delta):
	var dirVec := Vector2(0, 0)
	
	if Input.is_action_pressed("move_left"):
		dirVec.x = -1
	elif Input.is_action_pressed("move_right"):
		dirVec.x = 1
	if Input.is_action_pressed("move_up"):
		dirVec.y = -1
	elif Input.is_action_pressed("move_down"):
		dirVec.y = 1
	
	if (Input.is_action_pressed("Shoot") && can_shoot):
		var bullet := plBullet.instance()
		bullet.position = position
		get_tree().current_scene.add_child(bullet)
		can_shoot = false
		timer.start()

	vel = dirVec.normalized() * speed
	position += vel * delta
	
	var viewRect := get_viewport_rect()
	position.x = clamp(position.x, 0, viewRect.size.x)
	position.y = clamp(position.y, 0, viewRect.size.y)
	
	
