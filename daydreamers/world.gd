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
	print(camera.offset)

func _process(delta):
	camlerpend = Vector2(clamp(player.position.x, levelstart, levelend), 0)
	lerp_camera(camera.offset, camlerpend, delta * 5)
