extends Control

func _unhandled_key_input(event: InputEvent) -> void:
	Scene.changeTo("res://GameStart.tscn")
