extends Area2D

var ball : PackedScene = preload("res://gameParts/ball.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawnNewBall():
	var newBall = ball.instantiate()
	newBall.position = position
	get_parent().call_deferred("add_child", newBall)
