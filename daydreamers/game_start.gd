extends Control

func _on_button_pressed() -> void:
	Scene.changeTo("res://WeekStart.tscn")

func _on_button_mouse_entered() -> void:
	$Button/title.scale = Vector2(1.1, 1.1)


func _on_button_mouse_exited() -> void:
	$Button/title.scale = Vector2(1, 1)
