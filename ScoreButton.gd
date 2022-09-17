extends Control

var color
var value

onready var color_rect = get_node("ColorRect")
onready var button = get_node("Button")

func setup(new_color, new_value):
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


func _on_Button_pressed():
	if(Players.currentRollingPlayer == 1):
		get_node("Label").visible = true
	elif(Players.currentRollingPlayer == 2):
		get_node("Label2").visible = true
	elif(Players.currentRollingPlayer == 3):
		get_node("Label3").visible = true
	elif(Players.currentRollingPlayer == 4):
		get_node("Label4").visible = true
	elif(Players.currentRollingPlayer == 5):
		get_node("Label5").visible = true
