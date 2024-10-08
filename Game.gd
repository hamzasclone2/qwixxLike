extends Node

@onready var whiteDie1 = get_node("Dice/whiteDie1")
@onready var whiteDie2 = get_node("Dice/whiteDie2")
@onready var redDie = get_node("Dice/redDie")
@onready var yellowDie = get_node("Dice/yellowDie")
@onready var greenDie = get_node("Dice/greenDie")
@onready var blueDie = get_node("Dice/blueDie")

@onready var rollButton = get_node("RollButton")
@onready var nextButton = get_node("NextButton")
@onready var penaltyButton = get_node("PenaltyButton")

@onready var rollingPlayerLabel = get_node("RollingPlayerLabel")
@onready var scoringPlayerLabel = get_node("ScoringPlayerLabel")
@onready var penaltyLabel = get_node("PenaltiesLabel")
@onready var finalScoreLabel = get_node("FinalScoreLabel")

var rng = RandomNumberGenerator.new()

var whiteDie1Num
var whiteDie2Num
var redDieNum
var yellowDieNum
var greenDieNum
var blueDieNum

var scoreButton = preload("res://ScoreButton.tscn")

@onready var scoreSheet = get_node("ScoreSheet")

var possibleWhite
var possibleRed1
var possibleRed2
var possibleYellow1
var possibleYellow2
var possibleGreen1
var possibleGreen2
var possibleBlue1
var possibleBlue2

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
		var s = scoreButton.instantiate()
		s.position.x = xpos
		s.position.y = ypos
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
		var s = scoreButton.instantiate()
		s.position.x = xpos
		s.position.y = ypos
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
		var s = scoreButton.instantiate()
		s.position.x = xpos
		s.position.y = ypos
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
		var s = scoreButton.instantiate()
		s.position.x = xpos
		s.position.y = ypos
		scoreSheet.add_child(s)
		var color = fourthRow.pop_front()
		s.name = color + str(i)
		s.setup(color, i, 3, xIndex)
		xIndex += 1
		xpos += 60
		
	Players.currentRollingPlayerIndex = 0
	Players.currentScoringPlayerIndex = 0
	Players.playerHasRolled = false
	Players.scoringPlayerHasSelected = false
	Players.rollingPlayerHasScored = false
	penaltyButton.disabled = true
	
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
	
	possibleWhite = whiteDie1Num + whiteDie2Num
	possibleRed1 = redDieNum + whiteDie1Num
	possibleRed2 = redDieNum + whiteDie2Num
	possibleYellow1 = yellowDieNum + whiteDie1Num
	possibleYellow2 = yellowDieNum + whiteDie2Num
	possibleGreen1 = greenDieNum + whiteDie1Num
	possibleGreen2 = greenDieNum + whiteDie2Num
	possibleBlue1 = blueDieNum + whiteDie1Num
	possibleBlue2 = blueDieNum + whiteDie2Num
	

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
	checkScoreSheet()

func _on_NextButton_pressed():
	Players.scoringPlayerHasSelected = false
	Players.rollingPlayerHasScored = false
	clearScoreSheet()
	Players.currentScoringPlayerIndex += 1
	if(Players.currentScoringPlayerIndex == Players.players.size()):
		Players.currentScoringPlayerIndex = 0
	
	if(Players.currentScoringPlayerIndex == Players.currentRollingPlayerIndex):
		Players.playerHasRolled = false
		Players.currentRollingPlayerIndex += 1
		
	if(Players.currentRollingPlayerIndex == Players.players.size()):
		Players.currentRollingPlayerIndex = 0

	if(Players.playerHasRolled):
		checkScoreSheet()
	checkButtons()

func checkButtons():
	if(Players.currentScoringPlayerIndex == Players.currentRollingPlayerIndex and Players.playerHasRolled):
		penaltyButton.disabled = false
	else:
		penaltyButton.disabled = true
		
	if(Players.playerHasRolled):
		rollButton.disabled = true
		nextButton.disabled = false
		scoringPlayerLabel.visible = true
		penaltyLabel.visible = true
	else:
		rollButton.disabled = false
		nextButton.disabled = true
		scoringPlayerLabel.visible = false
		penaltyLabel.visible = false
		
	rollingPlayerLabel.text = "Player " + str(Players.players[Players.currentRollingPlayerIndex]) + "'s Roll"
	scoringPlayerLabel.text = "Player " + str(Players.players[Players.currentScoringPlayerIndex]) + " is scoring..."
	penaltyLabel.text = "Penalties: " + str(Players.penalties[Players.players[Players.currentScoringPlayerIndex] - 1])
	
func checkScoreSheet():
	checkColor(possibleWhite, "white")
	if(Players.currentRollingPlayerIndex == Players.currentScoringPlayerIndex):
		checkColor(possibleRed1, "red")
		checkColor(possibleRed2, "red")
		checkColor(possibleYellow1, "yellow")
		checkColor(possibleYellow2, "yellow")
		checkColor(possibleGreen1, "green")
		checkColor(possibleGreen2, "green")
		checkColor(possibleBlue1, "blue")
		checkColor(possibleBlue2, "blue")
		
func clearScoreSheet():
	for i in range(4):
		for j in range(11):
			if(Players.playerScoreSheets[Players.players[Players.currentScoringPlayerIndex] - 1][i][j] == 0):
				Players.playerScoreSheets[Players.players[Players.currentScoringPlayerIndex] - 1][i][j] = -1

func checkColor(roll, color):
	if(roll == 12 and (color == "white" or color == "red")):
		if(Players.playerScoreSheets[Players.players[Players.currentScoringPlayerIndex] - 1][0].count(1) >= 5):
			if(Players.playerScoreSheets[Players.players[Players.currentScoringPlayerIndex] - 1][0][roll-2] == -1):
				Players.playerScoreSheets[Players.players[Players.currentScoringPlayerIndex] - 1][0][roll-2] = 0

				
	if(roll == 12 and (color == "white" or color == "yellow")):
		if(Players.playerScoreSheets[Players.players[Players.currentScoringPlayerIndex] - 1][1].count(1) >= 5):
			if(Players.playerScoreSheets[Players.players[Players.currentScoringPlayerIndex] - 1][1][roll-2] == -1):
				Players.playerScoreSheets[Players.players[Players.currentScoringPlayerIndex] - 1][1][roll-2] = 0

	if(roll == 2 and (color == "white" or color == "green")):
		if(Players.playerScoreSheets[Players.players[Players.currentScoringPlayerIndex] - 1][2].count(1) >= 5):
			if(Players.playerScoreSheets[Players.players[Players.currentScoringPlayerIndex] - 1][2][roll-2] == -1):
				Players.playerScoreSheets[Players.players[Players.currentScoringPlayerIndex] - 1][2][roll-2] = 0

	if(roll == 2 and (color == "white" or color == "red")):
		if(Players.playerScoreSheets[Players.players[Players.currentScoringPlayerIndex] - 1][3].count(1) >= 5):
			if(Players.playerScoreSheets[Players.players[Players.currentScoringPlayerIndex] - 1][3][roll-2] == -1):
				Players.playerScoreSheets[Players.players[Players.currentScoringPlayerIndex] - 1][3][roll-2] = 0

	
	
	if(color == 'white' or color == 'red'):
		if(roll != 12 and Players.playerScoreSheets[Players.players[Players.currentScoringPlayerIndex] - 1][0][roll-2] == -1):
			Players.playerScoreSheets[Players.players[Players.currentScoringPlayerIndex] - 1][0][roll-2] = 0
	if(color == 'white' or color == 'yellow'):
		if(roll != 12 and Players.playerScoreSheets[Players.players[Players.currentScoringPlayerIndex] - 1][1][roll-2] == -1):
			Players.playerScoreSheets[Players.players[Players.currentScoringPlayerIndex] - 1][1][roll-2] = 0
	
	var reverseIndex = convertRollToIndex(roll)
	if(color == 'white' or color == 'green'):
		if(roll != 2 and Players.playerScoreSheets[Players.players[Players.currentScoringPlayerIndex] - 1][2][reverseIndex] == -1):
			Players.playerScoreSheets[Players.players[Players.currentScoringPlayerIndex] - 1][2][reverseIndex] = 0
		
	if(color == 'white' or color == 'blue'):
		if(roll != 2 and Players.playerScoreSheets[Players.players[Players.currentScoringPlayerIndex] - 1][3][reverseIndex] == -1):
			Players.playerScoreSheets[Players.players[Players.currentScoringPlayerIndex] - 1][3][reverseIndex] = 0

func convertRollToIndex(roll):
	if(roll == 12):
		return 0
	elif(roll == 11):
		return 1
	elif(roll == 10):
		return 2
	elif(roll == 9):
		return 3
	elif(roll == 8):
		return 4
	elif(roll == 7):
		return 5
	elif(roll == 6):
		return 6
	elif(roll == 5):
		return 7
	elif(roll == 4):
		return 8
	elif(roll == 3):
		return 9
	elif(roll == 2):
		return 10

func _on_PenaltyButton_pressed():
	penaltyButton.disabled = true
	Players.rollingPlayerHasScored = true
	Players.penalties[Players.players[Players.currentScoringPlayerIndex] - 1] += 1
	penaltyLabel.text = "Penalties: " + str(Players.penalties[Players.players[Players.currentScoringPlayerIndex] - 1])
	if(Players.penalties[Players.players[Players.currentScoringPlayerIndex] - 1] == 4):
		gameOver()
		
func gameOver():
	var s = "Final Score: \n"
	var score = 0
	var count = 0
	
	for i in Players.players:
		for j in range(4):
			count = Players.playerScoreSheets[i - 1][j].count(1)
			score += convertCountToScore(count)
		
		score -= 5 * Players.penalties[i-1]
		s += "Player " + str(i) + " Final Score: " + str(score) + "\n"
		score = 0
	
	finalScoreLabel.text = s
	finalScoreLabel.visible = true
		

	
func convertCountToScore(count):
	var score
	if(count == 1):
		score = 1
	elif(count == 2):
		score = 3
	elif(count == 3):
		score = 6
	elif(count == 4):
		score = 10
	elif(count == 5):
		score = 15
	elif(count == 6):
		score = 21
	elif(count == 7):
		score = 28
	elif(count == 8):
		score = 36
	elif(count == 9):
		score = 45
	elif(count == 10):
		score = 55
	elif(count == 11):
		score = 66
	elif(count == 12):
		score = 78
	else:
		score = 0
	return score
	


func _on_Button_pressed():
	gameOver()
	
func _process(delta):
	if(Players.currentRollingPlayerIndex == Players.currentScoringPlayerIndex):
		if(Players.rollingPlayerHasScored == false):
			nextButton.disabled = true
		else:
			nextButton.disabled = false
			penaltyButton.disabled = true
