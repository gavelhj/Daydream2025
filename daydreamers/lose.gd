extends Control
@onready var canleave = false

func _ready():
	await get_tree().create_timer(3).timeout
	var canleave = true
	$message3.text = "total weeks survived " + str(Game.week)
	

func _input(event: InputEvent) -> void:
	if canleave:
		Scene.changeTo("res://GameStart")
