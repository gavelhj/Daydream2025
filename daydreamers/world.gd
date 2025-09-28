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
	player.position = Vector2.ZERO


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body == %Player:
		Scene.changeTo()
