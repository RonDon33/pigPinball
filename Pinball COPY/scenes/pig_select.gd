extends Control

@onready var playerInventory : pigList = GlobalInfo.playerInventory
@onready var chosenNameLabel : Label = $name
@onready var chosenDescriptionLabel : Label = $description
var slots : Array 
var chosenIndex : int

@onready var slotList : VBoxContainer = $Sprite2D/ScrollContainer/VBoxContainer
@onready var slotObject = preload("res://gameParts/slot.tscn")
var numPigs : int 


# Called when the node enters the scene tree for the first time.
func _ready():
	playerInventory.pigs.sort_custom(playerInventory.sort_by_id)
	addSlots()
	slots = $Sprite2D/ScrollContainer/VBoxContainer.get_children()
	
	updateSlots()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func updateSlots():
	slots = $Sprite2D/ScrollContainer/VBoxContainer.get_children()
	
	for i in slots.size():
		if i<playerInventory.pigs.size():
			slots[i].setSlotItem(playerInventory.pigs[i].pigSprite.get_image())
			slots[i].slotPig = playerInventory.pigs[i]
			slots[i].slotIndex = i
			slots[i].slotID = playerInventory.pigs[i].pigID
			slots[i].slotName = playerInventory.pigs[i].pigName
			slots[i].slotDescription = playerInventory.pigs[i].pigDescription
		else:
			slots[i].visible = false
	
func addSlots():
	for i in playerInventory.pigs.size():
		slotList.add_child(slotObject.instantiate())
		
		
	
func _on_sell_pressed():
	var pigInUse =  get_tree().get_first_node_in_group("pigInUse")
	pigInUse.visible = false
	
	if playerInventory.pigs.size() > 1: 
		playerInventory.pigs.remove_at(chosenIndex)
		updateSlots()
	


func _on_use_pressed():
	var pigInUse =  get_tree().get_first_node_in_group("pigInUse")
	pigInUse.visible = true
	
	GlobalInfo.chosenPig = playerInventory.pigs[chosenIndex]


func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/select_screen.tscn")
