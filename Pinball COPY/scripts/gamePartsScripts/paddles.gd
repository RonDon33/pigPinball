extends Node2D

var leftPaddle : CharacterBody2D
var rightPaddle : CharacterBody2D

@export var rotationSpeed : float = 600
var rotationDistance : float = 50
var hitForce : float = 80

var leftRotationOriginal : float 
var leftRotationMax : float 
var rightRotationOriginal : float 
var rightRotationMax : float 


# Called when the node enters the scene tree for the first time.
func _ready():
	
	leftPaddle = $LeftPaddle
	rightPaddle = $RightPaddle
	
	
	leftRotationOriginal = leftPaddle.rotation_degrees
	leftRotationMax = leftRotationOriginal - rotationDistance

	rightRotationOriginal = rightPaddle.rotation_degrees
	rightRotationMax = rightRotationOriginal + rotationDistance

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("leftPaddle"):
		leftPaddle.rotation_degrees = max(leftPaddle.rotation_degrees - rotationSpeed * delta, leftRotationOriginal - rotationDistance)
	else:
		leftPaddle.rotation_degrees = min(leftPaddle.rotation_degrees + rotationSpeed * delta, leftRotationOriginal)

	if Input.is_action_pressed("rightPaddle"):
		rightPaddle.rotation_degrees = min(rightPaddle.rotation_degrees + rotationSpeed * delta, rightRotationOriginal + rotationDistance)
	else:
		rightPaddle.rotation_degrees = max(rightPaddle.rotation_degrees - rotationSpeed * delta, rightRotationOriginal)
		
