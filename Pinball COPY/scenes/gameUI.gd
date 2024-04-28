extends Control

@onready var scoreLabel = $Score
var paused: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	unpause()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if scoreLabel.text != ("Score: %d" %GlobalInfo.roundPoints):
		scoreLabel.text = ("Score: %d" %GlobalInfo.roundPoints)
	
	if Input.is_action_just_pressed("esc"):
		if paused == true:
			unpause()
		else:
			pause()



func _on_pause_pressed():
	pause()

func _on_resume_pressed():
	unpause()

func _on_quit_pressed():
	get_tree().change_scene_to_file("res://scenes/select_screen.tscn")



func pause():
	get_tree().paused = true
	paused = true
	get_tree().get_first_node_in_group("pauseMenu").visible = true

func unpause():
	get_tree().paused = false
	paused = false
	get_tree().get_first_node_in_group("pauseMenu").visible = false
