extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_pressed():
	get_tree().change_scene_to_file("res://scenes/pinballBoardOne.tscn")


func _on_pig_select_pressed():
	get_tree().change_scene_to_file("res://scenes/pig_select.tscn")


func _on_quit_pressed():
	get_tree().quit()
