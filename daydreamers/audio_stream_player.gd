extends AudioStreamPlayer

func _process(_delta: float) -> void:
	if playing != Global.music:
		playing = Global.music
