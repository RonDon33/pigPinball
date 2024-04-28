extends StaticBody2D

@onready var initialPos : Vector2 = global_position
@export var targetPos : Vector2 
@export var speed : float = 50

@export var pointVal : int = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	targetPos = initialPos + targetPos


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = global_position.move_toward(targetPos, speed * delta)
	
	if global_position == targetPos:
		targetPos = initialPos
		initialPos = global_position



func _on_points_body_entered(body):
	if body.is_in_group("ball"):
		get_parent().get_parent().addPoints(pointVal)
