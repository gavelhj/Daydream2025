extends Button


func _on_pressed() -> void:
	Scene.changeTo("res://controls.tscn")


func _on_mouse_entered() -> void:
	$title.scale = Vector2(1.1, 1.1)


func _on_mouse_exited() -> void:
	$title.scale = Vector2(1.0, 1.0)
