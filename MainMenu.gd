extends Control

func _ready():
	pass
	
func _on_QuitGameButton_pressed():
	get_tree().quit()


func _on_PlayGameButton_pressed():
	get_tree().change_scene_to_file("res://PlayerSelectMenu.tscn")

