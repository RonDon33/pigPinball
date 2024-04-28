extends CharacterBody2D


var lowerSpeed : float = 100
@export var launchSpeed : float = 1000

var originalPosition : Vector2
var maxLaunch : float = 50

var rng = RandomNumberGenerator.new()

func _ready():
	originalPosition = position
	launchSpeed = rng.randf_range(2100, 2500)

func _physics_process(delta):
	if Input.is_action_pressed("launch"):
		position.y = min(position.y + lowerSpeed * delta, originalPosition.y + maxLaunch)
	else:
		position.y = max(position.y - launchSpeed * delta, originalPosition.y)
