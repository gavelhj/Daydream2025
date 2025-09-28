extends StaticBody2D

var isdraggable = true
var dragging = false
var candrag = false
var waspressing = true

func _process(delta:float)->void:
	var mousepos = get_viewport().get_mouse_position()
	var globalmousepos = get_global_mouse_position()
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if candrag == true and isdraggable == true:
			position = mousepos
			dragging = true
	if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if dragging == true:
			position = globalmousepos
			isdraggable = false
		dragging = false


func _on_area_mouse_entered() -> void:
	candrag = true

func _on_area_mouse_exited() -> void:
	candrag = false
