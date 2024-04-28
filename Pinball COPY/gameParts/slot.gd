extends Panel

@onready var slotItem : Sprite2D = $visual
var slotPig : pigData
var slotIndex : int
var slotID : int 
var slotName : String
var slotDescription : String


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func setSlotItem(texture):
	slotItem.texture = ImageTexture.create_from_image(texture)


func _on_button_pressed():
	var nameText = get_tree().get_first_node_in_group("pigName")
	var descText = get_tree().get_first_node_in_group("pigDescription")
	var pigSelect = get_tree().get_first_node_in_group("pigSelect")
	
	var pigInUse =  get_tree().get_first_node_in_group("pigInUse")
	pigInUse.visible = false
	
	pigSelect.chosenIndex = slotIndex
	if nameText != null:
		nameText.text = slotName
		descText.text = slotDescription
	
	
