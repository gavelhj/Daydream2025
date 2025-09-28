extends Node

var balance = 0
var quota = 700
var daysleft = 5

func night_check():
	if daysleft == 0 and balance < quota:
		begin_level("night")

func begin_level(time): #day or night
	Scene.changeTo("res://World.tscn")
	var player = load("res://Player.tscn")
	player.instantiate()
	player.position = Vector2.ZERO

func game_loop_start():
	pass
