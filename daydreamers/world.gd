extends Node2D

@onready var camera = $Camera2D
@onready var player = $Player

@onready var camlerpstart = Vector2.ZERO
@onready var camlerpend = Vector2.ZERO

@onready var levelstart = -100
@onready var levelend = 100

func lerp_camera(start, end, delta=1):
	camera.offset.x = lerp(start.x, end.x, delta)
	camera.offset.y = lerp(start.y, end.y, delta)

func _process(delta):
	#camlerpend = Vector2(clamp(player.position.x, levelstart, levelend), 0)
	lerp_camera(camera.offset, player.position, delta * 5)
	

var values = {
	rocket = 200,
	plank = 150,
	box = 100,
	spring = 150,
	apple = 100
}

func _enter_tree() -> void:
	print(Inventory.items)
	player = $Player
	camera = $Camera2D
	player.position = Vector2.ZERO
	if Game.night_check() == 1:
		$bg/City/realdaycity.visible = true
		$bg/City/realnightcity.visible = false
		$bg/Opera/realopera.visible = true
		$bg/Opera/realnightopera.visible = false
		$bg/Sky/realsun.visible = true
		$bg/Sky/realmoon.visible = false
	else:
		$bg/City/realdaycity.visible = false
		$bg/City/realnightcity.visible = true
		$bg/Opera/realopera.visible = false
		$bg/Opera/realnightopera.visible = true
		$bg/Sky/realsun.visible = false
		$bg/Sky/realmoon.visible = true


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == %Player:
		Inventory.items.clear()
		Game.end_level(false)
