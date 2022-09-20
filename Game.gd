extends Node

onready var whiteDie1 = get_node("Dice/whiteDie1")
onready var whiteDie2 = get_node("Dice/whiteDie2")
onready var redDie = get_node("Dice/redDie")
onready var yellowDie = get_node("Dice/yellowDie")
onready var greenDie = get_node("Dice/greenDie")
onready var blueDie = get_node("Dice/blueDie")

onready var rollButton = get_node("RollButton")
onready var nextButton = get_node("NextButton")

onready var rollingPlayerLabel = get_node("RollingPlayerLabel")
onready var scoringPlayerLabel = get_node("ScoringPlayerLabel")

var rng = RandomNumberGenerator.new()

var whiteDie1Num
var whiteDie2Num
var redDieNum
var yellowDieNum
var greenDieNum
var blueDieNum

var scoreButton = preload("res://ScoreButton.tscn")

onready var scoreSheet = get_node("ScoreSheet")

var scoreSheetColors = [
	['R','R','R','R','R','R','R','R','R','R','R'],
	['Y','Y','Y','Y','Y','Y','Y','Y','Y','Y','Y'],
	['G','G','G','G','G','G','G','G','G','G','G'],
	['B','B','B','B','B','B','B','B','B','B','B']
]

func _ready():
	var xIndex = 0
	var firstRow = scoreSheetColors[0]
	var xpos = 200
	var ypos = 0
	for i in range(2, 13):
		var s = scoreButton.instance()
		s.rect_position.x = xpos
		s.rect_position.y = ypos
		scoreSheet.add_child(s)
		var color = firstRow.pop_front()
		s.name = color + str(i)
		s.setup(color, i, 0, xIndex)
		xIndex += 1
		xpos += 60
		
	xIndex = 0
	var secondRow = scoreSheetColors[1]
	xpos = 200
	ypos = 60
	for i in range(2, 13):
		var s = scoreButton.instance()
		s.rect_position.x = xpos
		s.rect_position.y = ypos
		scoreSheet.add_child(s)
		var color = secondRow.pop_front()
		s.name = color + str(i)
		s.setup(color, i, 1, xIndex)
		xIndex += 1
		xpos += 60
		
	xIndex = 0
	var thirdRow = scoreSheetColors[2]
	xpos = 200
	ypos = 120
	for i in range(12, 1, -1):
		var s = scoreButton.instance()
		s.rect_position.x = xpos
		s.rect_position.y = ypos
		scoreSheet.add_child(s)
		var color = thirdRow.pop_front()
		s.name = color + str(i)
		s.setup(color, i, 2, xIndex)
		xIndex += 1
		xpos += 60
		
	xIndex = 0
	var fourthRow = scoreSheetColors[3]
	xpos = 200
	ypos = 180
	for i in range(12, 1, -1):
		var s = scoreButton.instance()
		s.rect_position.x = xpos
		s.rect_position.y = ypos
		scoreSheet.add_child(s)
		var color = fourthRow.pop_front()
		s.name = color + str(i)
		s.setup(color, i, 3, xIndex)
		xIndex += 1
		xpos += 60
		
	Players.currentRollingPlayerIndex = 0
	Players.currentScoringPlayerIndex = 0
	Players.playerHasRolled = false
	
	checkButtons()
	
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
	Players.playerHasRolled = true
	Players.currentScoringPlayerIndex = Players.currentRollingPlayerIndex

	checkButtons()
	rollAll()

func _on_NextButton_pressed():
	Players.currentScoringPlayerIndex += 1
	if(Players.currentScoringPlayerIndex == Players.players.size()):
		Players.currentScoringPlayerIndex = 0
	
	if(Players.currentScoringPlayerIndex == Players.currentRollingPlayerIndex):
		Players.playerHasRolled = false
		Players.currentRollingPlayerIndex += 1
		
	if(Players.currentRollingPlayerIndex == Players.players.size()):
		Players.currentRollingPlayerIndex = 0

	
	checkButtons()

func checkButtons():
	if(Players.playerHasRolled):
		rollButton.disabled = true
		nextButton.disabled = false
		scoringPlayerLabel.visible = true
	else:
		rollButton.disabled = false
		nextButton.disabled = true
		scoringPlayerLabel.visible = false
		
	rollingPlayerLabel.text = "Player " + str(Players.players[Players.currentRollingPlayerIndex]) + "'s Roll"
	scoringPlayerLabel.text = "Player " + str(Players.players[Players.currentScoringPlayerIndex]) + " is scoring..."
