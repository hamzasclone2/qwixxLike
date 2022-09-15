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
