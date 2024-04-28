extends Area2D

var holeB : Area2D

var oldBall : RigidBody2D
var ballSprite : Sprite2D

var ball : PackedScene = preload("res://gameParts/ball.tscn")
var newBallSprite : Sprite2D


@export var holdTime : float = 3
var ballEntered : float

# Called when the node enters the scene tree for the first time.
func _ready():
	holeB = get_parent().get_child(1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if not oldBall == null:
		if ballSprite == null:
			oldBall.move_body(holeB.global_position)
			ballSprite = oldBall.getSprite()
			ballEntered = Time.get_ticks_msec()/1000.0
		
		oldBall.queue_free()
		
		
		ballSprite.visible = false
		oldBall.gravity_scale = 0
		oldBall.linear_velocity = Vector2(0,0)
		
		
		if Time.get_ticks_msec()/1000.0-ballEntered >= holdTime:
			var newBall = ball.instantiate()
			newBall.position = holeB.position
			newBallSprite = newBall.get_child(0)
			newBallSprite = ballSprite
			
			get_parent().get_parent().add_child(newBall)
			
			ballSprite = null
			oldBall = null

func _on_body_entered(body):
	if body.is_in_group("ball"):
		oldBall = body
