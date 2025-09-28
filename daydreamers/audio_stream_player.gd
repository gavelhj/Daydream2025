extends AudioStreamPlayer

func _process(delta: float) -> void:
	if playing != Global.music:
		playing = Global.music
