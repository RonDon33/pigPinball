extends RigidBody2D

@onready var sprite : Sprite2D = $Sprite2D
var reset_state = false
var moveVector : Vector2

var rng = RandomNumberGenerator.new()


@onready var pigOptions : pigList = preload("res://thePigs/total_pigs.tres")
var totalPigs : int
var randomPig : int
@onready var ballSprite = ImageTexture.create_from_image(get_parent().get_parent().getBallSprite())

func _ready():
	sprite.texture = ballSprite


func _process(delta):
	pass

func getSprite():
	return sprite


func _on_area_2d_body_entered(body):
	if body.is_in_group("bumper"):
		get_parent().get_parent().addPoints(body.pointVal)
		GlobalInfo.roundPoints += body.pointVal
