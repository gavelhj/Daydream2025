extends Node

func showoverlay(node: CanvasLayer): #overlays a canvas layer over the screen
	node.visible = true

func hideoverlay(node: CanvasLayer):
	node.visible = false

func changeTo(path):
	get_tree().change_scene_to_file(path)

func summon(projectilescenename):
	var projectile = load(projectilescenename).instantiate()
	return projectile
