extends Control



func _on_button_pressed() -> void:
	Scene.changeTo("res://WeekStart.tscn")


func _on_button_mouse_entered() -> void:
	$Days.scale = Vector2(1.1, 1.1)


func _on_button_mouse_exited() -> void:
	$Days.scale = Vector2(1, 1)
