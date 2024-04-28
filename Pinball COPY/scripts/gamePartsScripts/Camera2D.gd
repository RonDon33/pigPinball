extends Camera2D

var initialPosition = self.position
var ball : RigidBody2D = null


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(ball == null):
		ball = get_tree().get_first_node_in_group("ball")
	
	if(ball != null and ball.position.y < initialPosition.y):
		self.position.y = ball.position.y

