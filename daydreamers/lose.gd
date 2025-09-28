extends Control
@onready var canleave = false

func _ready():
	$message3.text = "total weeks survived " + str(Game.week)
	await get_tree().create_timer(1).timeout
	canleave = true
	

func _input(_event: InputEvent) -> void:
	if canleave:
		Scene.changeTo("res://GameStart.tscn")
		Game.night = false
		Game.week = 1
		Game.daysleft = 5
		Game.balance = 0
