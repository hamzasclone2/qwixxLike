extends Node

var playerTypes = ["Human", "AI", "None", "None", "None"]

var playerScoreSheets = []
var players = [1, 2]

var penalties = [0, 0, 0, 0, 0]

var currentRollingPlayerIndex
var currentScoringPlayerIndex

var playerHasRolled
var rollingPlayerHasSelected
var scoringPlayerHasSelected
	
func setup():
	# -2 : Not available to select at all
	# -1 : Not available to select right now, but may be able to depending on the dice
	#  0 : Currently able to be selected
	#  1 : Has been selected 
	
	playerScoreSheets.append([ # Player 1
		[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]
	])
	playerScoreSheets.append([ # Player 2
		[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]
	])
	if(playerTypes[2] != "None"): # Player 3
		playerScoreSheets.append([
		[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]
	])
		players.append(3)
	else:
		playerScoreSheets.append([])
	if(playerTypes[3] != "None"): # Player 4
		playerScoreSheets.append([
		[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]
	])
		players.append(4)
	else:
		playerScoreSheets.append([])
	if(playerTypes[4] != "None"): # Player 5
		playerScoreSheets.append([
		[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],
		[-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1]
	])
		players.append(5)
	else:
		playerScoreSheets.append([])
	

