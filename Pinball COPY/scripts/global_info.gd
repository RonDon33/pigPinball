extends Node

@export var chosenPig : pigData

var roundPoints : int = 0

@onready var playerInventory = preload("res://thePigs/pigLists/PLAYER INVENTORY/playerPigInventory.tres")
@onready var newlyCaught = preload("res://thePigs/pigLists/PLAYER INVENTORY/newlyCaught.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	if chosenPig == null:
		chosenPig = preload("res://thePigs/0_pig_pink.tres")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func catchCurrentPig(pig):
	playerInventory.pigs.append(pig)
	newlyCaught.pigs.append(pig)
	print_debug("added ", pig.pigName)
	
	print_debug("inventory pigs: ")
	for pigData in playerInventory.pigs:
		print_debug(pigData.pigName)

func retrievePigPool(location, rarity):
	match location:
		"field":
			match rarity:
				"Common":
					return preload("res://thePigs/pigLists/field/pigPool_field_common.tres")
				"Rare":
					return preload("res://thePigs/pigLists/field/pigPool_field_rare.tres")
				"Epic":
					return preload("res://thePigs/pigLists/field/pigPool_field_epic.tres")
				"Pig of Legend":
					return preload("res://thePigs/pigLists/field/pigPool_field_legend.tres")
