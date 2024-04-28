extends Area2D

var holeA : CollisionShape2D

var ball : RigidBody2D
var ballSprite : Sprite2D

@export var holdTime : float = 3
var ballEntered : float

# Called when the node enters the scene tree for the first time.
func _ready():
	holeA = get_parent().get_child(0).get_child(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not ball == null:
		if ballSprite == null:
			ball.move_body(holeA.global_position)
			print_debug(ball.position)
			ballSprite = ball.getSprite()
			ballEntered = Time.get_ticks_msec()/1000.0
		
		ballSprite.visible = false
		ball.gravity_scale = 0
		ball.linear_velocity = Vector2(0,0)
		
		if Time.get_ticks_msec()/1000.0-ballEntered >= holdTime:
			
			ballSprite.visible = true
			ball.gravity_scale = 1
			ballSprite = null
			ball = null

func _on_body_entered(body):
	if body.is_in_group("ball"):
		ball = body
