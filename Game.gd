extends Node

onready var whiteDie1 = get_node("Control/whiteDie1")
onready var whiteDie2 = get_node("Control/whiteDie2")
onready var redDie = get_node("Control/redDie")
onready var yellowDie = get_node("Control/yellowDie")
onready var greenDie = get_node("Control/greenDie")
onready var blueDie = get_node("Control/blueDie")

onready var rollButton = get_node("Control/rollButton")

var rng = RandomNumberGenerator.new()

var whiteDie1Num
var whiteDie2Num
var redDieNum
var yellowDieNum
var greenDieNum
var blueDieNum

func _ready():
	pass
	
func rollAll():
	rng.randomize()
	
	whiteDie1Num = rng.randi_range(1, 6)
	whiteDie2Num = rng.randi_range(1, 6)
	redDieNum = rng.randi_range(1, 6)
	yellowDieNum = rng.randi_range(1, 6)
	greenDieNum = rng.randi_range(1, 6)
	blueDieNum = rng.randi_range(1, 6)
	
	roll(whiteDie1Num, whiteDie1, "white")
	roll(whiteDie2Num, whiteDie2, "white")
	roll(redDieNum, redDie, "red")
	roll(yellowDieNum, yellowDie, "yellow")
	roll(greenDieNum, greenDie, "green")
	roll(blueDieNum, blueDie, "blue")
	
	var possibleWhite = whiteDie1Num + whiteDie2Num
	var possibleRed1 = redDieNum + whiteDie1Num
	var possibleRed2 = redDieNum + whiteDie2Num
	var possibleYellow1 = yellowDieNum + whiteDie1Num
	var possibleYellow2 = yellowDieNum + whiteDie2Num
	var possibleGreen1 = greenDieNum + whiteDie1Num
	var possibleGreen2 = greenDieNum + whiteDie2Num
	var possibleBlue1 = blueDieNum + whiteDie1Num
	var possibleBlue2 = blueDieNum + whiteDie2Num
	
	print("White: ", possibleWhite)
	print("Red: ", possibleRed1)
	print("Red: ", possibleRed2)
	print("Yellow: ", possibleYellow1)
	print("Yellow: ", possibleYellow2)
	print("Green: ", possibleGreen1)
	print("Green: ", possibleGreen2)
	print("Blue: ", possibleBlue1)
	print("Blue: ", possibleBlue2)
	
	var redArray = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	var yellowArray = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	var greenArray = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	var blueArray = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	
	redArray[possibleRed1] = 1
	redArray[possibleRed2] = 1
	yellowArray[possibleYellow1] = 1
	yellowArray[possibleYellow2] = 1
	greenArray[possibleGreen1] = 1
	greenArray[possibleGreen2] = 1
	blueArray[possibleBlue1] = 1
	blueArray[possibleBlue2] = 1
	
	print(redArray)
	print(yellowArray)
	print(greenArray)
	print(blueArray)

func roll(dieNum, diceTexture, color):
	var s
	if(dieNum == 1):
		s = "sprites/" + color + "One.png"
	elif(dieNum == 2):
		s = "sprites/" + color + "Two.png"
	elif(dieNum == 3):
		s = "sprites/" + color + "Three.png"
	elif(dieNum == 4):
		s = "sprites/" + color + "Four.png"
	elif(dieNum == 5):
		s = "sprites/" + color + "Five.png"
	else:
		s = "sprites/" + color + "Six.png"
	diceTexture.texture = load(s)

func _on_rollButton_button_up():
	rollAll()
