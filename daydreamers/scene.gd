extends Node

func showoverlay(node: CanvasLayer): #overlays a canvas layer over the screen
	node.visible = true

func hideoverlay(node: CanvasLayer):
	node.visible = false

func changeTo(path):
	get_tree().change_scene_to_file(path)

func summon(scenename, projectilescenename):
	var main = get_tree().get_root().get_node(scenename)
	var projectile = load(projectilescenename)
	return projectile
