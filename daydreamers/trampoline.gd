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
			$area/clickbox.disabled = true
			candrag = false
			$Area2D.monitoring = true
			dragging = false
			if get_parent().name == "Inventory":
				Inventory.items.erase("trampoline")


func _on_area_mouse_entered() -> void:
	if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		candrag = true

func _on_area_mouse_exited() -> void:
	if not Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		candrag = false
		

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		body.velocity.y = -500
