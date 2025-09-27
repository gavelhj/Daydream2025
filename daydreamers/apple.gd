extends Sprite2D

@onready var lifetime

func _physics_process(delta: float) -> void:
	position.y -= 100 * delta
	lifetime += delta
	if lifetime > 3:
		queue_free()
