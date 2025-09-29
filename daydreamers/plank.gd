extends StaticBody2D

var dragging = false
var candrag = false
var waspressing = true

func _process(_delta:float)->void:
	if candrag == true:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
				position = get_global_mouse_position()
				dragging = true
	if dragging == true:
		if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			set_meta('Candrag', false)
			position = get_global_mouse_position()
			$CollisionShape2D.disabled = false
			$area/clickbox.disabled = true
			candrag = false
			dragging = false
			if get_parent().name == "Inventory":
				Inventory.items.erase("plank")


func _on_area_mouse_entered() -> void:
	if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		candrag = true

func _on_area_mouse_exited() -> void:
	if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		candrag = false
