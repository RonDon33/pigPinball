extends Area2D

var ball : RigidBody2D
var ballSprite : Sprite2D

@export var pointVal : int = 500
@export var holdTime : float = 1
var ballEntered : float

@export var isWarp : bool = true
var warpOn : bool = false
@export var destination : String

var pointsToGet : int
var warpPoints : int 


var rng = RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	setWarpPoints()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GlobalInfo.roundPoints >= warpPoints :
		warpOn = true
	
	
	if not ball == null:
		if ballSprite == null:
			ballSprite = ball.getSprite()
			ballEntered = Time.get_ticks_msec()/1000.0
		
		ballSprite.visible = false
		ball.gravity_scale = 0
		ball.linear_velocity = Vector2(0,0)
		ball.position = self.position
		
		if Time.get_ticks_msec()/1000.0-ballEntered >= holdTime:
			print_debug("lets go")
			ball.position = self.position
			ballSprite.visible = true
			ball.gravity_scale = 1
			ballSprite = null
			ball = null

func _on_body_entered(body):
	if body.is_in_group("ball"):
		if isWarp == true and warpOn == true:
			if get_parent().get_parent().newPig == true:
				GlobalInfo.catchCurrentPig(get_parent().get_parent().randomPig)
			get_parent().get_parent().saveRoundPoints()
			get_tree().change_scene_to_file(destination)
		else:
			ball = body
			get_parent().get_parent().addPoints(pointVal)

func setWarpPoints():
	pointsToGet = rng.randi_range(5000,20000)
	warpPoints = GlobalInfo.roundPoints + pointsToGet
	print_debug(warpPoints)
