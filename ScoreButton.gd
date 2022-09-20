extends Control

var color
var value

var yIndex
var xIndex

onready var color_rect = get_node("ColorRect")
onready var button = get_node("Button")

func setup(new_color, new_value, y, x):
	if(new_color=="R"):
		color_rect.color = Color(1,0,0,1)
	elif(new_color=="G"):
		color_rect.color = Color(0,1,0,1)
	elif(new_color=="B"):
		color_rect.color = Color(0,0,1,1)
	elif(new_color=="Y"):
		color_rect.color = Color(1,1,0,1)
		
	button.text = str(new_value)
	value = new_value
	color = new_color
	
	yIndex = y
	xIndex = x


func _on_Button_pressed():
	if(Players.players[Players.currentScoringPlayerIndex] == 1):
		get_node("Label").visible = true
	elif(Players.players[Players.currentScoringPlayerIndex] == 2):
		get_node("Label2").visible = true
	elif(Players.players[Players.currentScoringPlayerIndex] == 3):
		get_node("Label3").visible = true
	elif(Players.players[Players.currentScoringPlayerIndex] == 4):
		get_node("Label4").visible = true
	elif(Players.players[Players.currentScoringPlayerIndex] == 5):
		get_node("Label5").visible = true
		
	
	Players.playerScoreSheets[Players.players[Players.currentScoringPlayerIndex] - 1][yIndex][xIndex] = 1
		
func _process(_delta):
	if(Players.playerHasRolled == false):
		button.disabled = true
	else:
		button.disabled = false
