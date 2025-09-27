extends Sprite2D

@onready var lifetime = 0

func _physics_process(delta: float) -> void:
	position.y += Global.gravity * delta
	lifetime += delta
	if lifetime > 3:
		queue_free()
