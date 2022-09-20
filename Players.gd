extends Node

var playerTypes = ["Human", "AI", "None", "None", "None"]

var playerScoreSheets = []
var players = [1, 2]

var currentRollingPlayerIndex
var currentScoringPlayerIndex

var playerHasRolled
	
func setup():
	playerScoreSheets.append([ # Player 1
		[0,0,0,0,0,0,0,0,0,0,-1],
		[0,0,0,0,0,0,0,0,0,0,-1],
		[0,0,0,0,0,0,0,0,0,0,-1],
		[0,0,0,0,0,0,0,0,0,0,-1]
	]) # Player 1
	playerScoreSheets.append([ # Player 2
		[0,0,0,0,0,0,0,0,0,0,-1],
		[0,0,0,0,0,0,0,0,0,0,-1],
		[0,0,0,0,0,0,0,0,0,0,-1],
		[0,0,0,0,0,0,0,0,0,0,-1]
	])
	if(playerTypes[2] != "None"): # Player 3
		playerScoreSheets.append([
		[0,0,0,0,0,0,0,0,0,0,-1],
		[0,0,0,0,0,0,0,0,0,0,-1],
		[0,0,0,0,0,0,0,0,0,0,-1],
		[0,0,0,0,0,0,0,0,0,0,-1]
	])
		players.append(3)
	else:
		playerScoreSheets.append([])
	if(playerTypes[3] != "None"): # Player 4
		playerScoreSheets.append([
		[0,0,0,0,0,0,0,0,0,0,-1],
		[0,0,0,0,0,0,0,0,0,0,-1],
		[0,0,0,0,0,0,0,0,0,0,-1],
		[0,0,0,0,0,0,0,0,0,0,-1]
	])
		players.append(4)
	else:
		playerScoreSheets.append([])
	if(playerTypes[4] != "None"): # Player 5
		playerScoreSheets.append([
		[0,0,0,0,0,0,0,0,0,0,-1],
		[0,0,0,0,0,0,0,0,0,0,-1],
		[0,0,0,0,0,0,0,0,0,0,-1],
		[0,0,0,0,0,0,0,0,0,0,-1]
	])
		players.append(5)
	else:
		playerScoreSheets.append([])
	

