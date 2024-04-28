extends RigidBody2D

@onready var initialPos : Vector2 = global_position
@export var targetPos : Vector2 
@export var speed : float = 50

# Called when the node enters the scene tree for the first time.
func _ready():
	targetPos = initialPos + targetPos


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = global_position.move_toward(targetPos, speed * delta)
	
	if global_position == targetPos:
		targetPos = initialPos
		initialPos = global_position
