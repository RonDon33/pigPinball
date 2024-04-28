extends Node2D


var totalPoints = 0
var oldPoints = 0

var bonusStagePoints = 0
var oldBonusStagePoints = 0

@export var newPig : bool
@export var location : String

var chosenPig
var chosenPigRarity


var rng = RandomNumberGenerator.new()
var pigOptions : pigList 
var totalPigs : int
var randomPig 
var randomSprite

#pig pools common, rare, epic, pig of legend

var pigPool : pigList

func _ready():
	
	if GlobalInfo.roundPoints != 0:
		totalPoints = GlobalInfo.roundPoints


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if oldPoints != totalPoints:
		#print_debug("round points ",totalPoints)
		oldPoints = totalPoints
		if newPig == true and oldBonusStagePoints != bonusStagePoints:
			#print_debug("bonus stage points ", bonusStagePoints)
			oldBonusStagePoints = bonusStagePoints
		

func addPoints(points : int):
	totalPoints+=points
	if newPig == true:
		bonusStagePoints += points
	

func getBallSprite():
	if newPig == true:
		if randomSprite == null:
			generateRandomPig()
		return randomSprite
	else:
		chosenPig = GlobalInfo.chosenPig
		return chosenPig.getSprite().get_image()

func generateRandomPig():
	chosenPigRarity = rng.randi_range(0,20)
	
	if chosenPigRarity <= 10:
		chosenPigRarity = "Common"
	elif chosenPigRarity <= 15:
		chosenPigRarity = "Rare"
	elif chosenPigRarity <= 18:
		chosenPigRarity = "Epic"
	else:
		chosenPigRarity = "Pig of Legend"
	
	print_debug(chosenPigRarity)
	
	pigOptions = GlobalInfo.retrievePigPool(location, chosenPigRarity)
	print_debug(pigOptions)
	
	totalPigs = pigOptions.getPigs().size()
	
	randomPig = pigOptions.pigs[rng.randi_range(0, totalPigs-1)] 
	print_debug("Chosen pig ", randomPig.pigName)
	
	randomSprite = randomPig.getSprite().get_image()

func saveRoundPoints():
	GlobalInfo.roundPoints = totalPoints

func catchPig():
	GlobalInfo.catchCurrentPig(pigOptions.pigs[randomPig])
