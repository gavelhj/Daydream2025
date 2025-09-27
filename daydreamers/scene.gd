extends Node

func overlay(node): #overlays a control node over the screen
	pass
	
func changeTo(path):
	get_tree().change_scene_to_file(path)
