extends Node

var playerTypes = ["Human", "AI", "None", "None", "None"]

var currentRollingPlayer = 0
var currentScoringPlayer = 0

var playerScoreSheets = []
	
func setup():
	var startingScoresheet = [
		[0,0,0,0,0,0,0,0,0,0,-1],
		[0,0,0,0,0,0,0,0,0,0,-1],
		[0,0,0,0,0,0,0,0,0,0,-1],
		[0,0,0,0,0,0,0,0,0,0,-1]
	]
	
	playerScoreSheets.append(startingScoresheet) # Player 1
	playerScoreSheets.append(startingScoresheet) # Player 2
	if(playerTypes[2] != "None"): # Player 3
		playerScoreSheets.append(startingScoresheet)
	else:
		playerScoreSheets.append([])
	if(playerTypes[3] != "None"): # Player 4
		playerScoreSheets.append(startingScoresheet)
	else:
		playerScoreSheets.append([])
	if(playerTypes[4] != "None"): # Player 5
		playerScoreSheets.append(startingScoresheet)
	else:
		playerScoreSheets.append([])
	
