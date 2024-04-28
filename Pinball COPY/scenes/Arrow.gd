extends Node2D

@export var hole : Area2D
@onready var anim : AnimatedSprite2D = $AnimatedSprite2D

var prevWarpOn : bool
var currWarpOn : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("OFF")
	prevWarpOn = hole.warpOn


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if prevWarpOn != hole.warpOn:
		anim.play("ON")
		prevWarpOn = hole.warpOn
