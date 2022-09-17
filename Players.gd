extends Node

var player2Type
var player3Type
var player4Type
var player5Type

var playerScoreSheets = []

func printTypes():
	print(player2Type)
	print(player3Type)
	print(player4Type)
	print(player5Type)
	
func setup():
	var startingScoresheet = [
		[0,0,0,0,0,0,0,0,0,0,-1],
		[0,0,0,0,0,0,0,0,0,0,-1],
		[0,0,0,0,0,0,0,0,0,0,-1],
		[0,0,0,0,0,0,0,0,0,0,-1]
	]
	
	playerScoreSheets.append(startingScoresheet) # Player 1
	playerScoreSheets.append(startingScoresheet) # Player 2
	if(player3Type != "None"):
		playerScoreSheets.append(startingScoresheet)
	else:
		playerScoreSheets.append([])
	if(player4Type != "None"):
		playerScoreSheets.append(startingScoresheet)
	else:
		playerScoreSheets.append([])
	if(player5Type != "None"):
		playerScoreSheets.append(startingScoresheet)
	else:
		playerScoreSheets.append([])
	
