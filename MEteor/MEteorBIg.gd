extends Area2D

export var minSpeed: float = 10
export var maxSpeed: float = 50
export var minrotationRate: float = -20
export var maxrotationRate: float = 20

export var life: int = 20

var speed: float = 0
var rotationRate: float = 0

func _ready():
	speed = rand_range(minSpeed, maxSpeed)
	rotationRate = rand_range(minrotationRate, maxrotationRate)
	
	
func _physics_process(delta):
	rotation_degrees += rotationRate * delta
	
	position.y += speed * delta

func damage(amount: int):
	life -= amount
	if life <= 0:
		queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	
func _on_MEteorBIg_area_entered(area):
	if area.get_name() == "Player":
		GlobalVars.player_dead = true

