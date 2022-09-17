extends Control

onready var player2 = get_node("Control/OptionButton")
onready var player3 = get_node("Control/OptionButton2")
onready var player4 = get_node("Control/OptionButton3")
onready var player5 = get_node("Control/OptionButton4")

func _on_Button_pressed():
	Players.player2Type = player2.get_item_text(player2.get_selected_id())
	Players.player3Type = player3.get_item_text(player3.get_selected_id())
	Players.player4Type = player4.get_item_text(player4.get_selected_id())
	Players.player5Type = player5.get_item_text(player5.get_selected_id())
	
	Players.setup()
	
	get_tree().change_scene("res://Game.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://MainMenu.tscn")
