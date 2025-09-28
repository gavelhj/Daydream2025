extends Node

@onready var balance = 0
@onready var quota = 700
@onready var daysleft = 5
@onready var night = false

func sell_items():
	for price in Inventory.items:
		Global.money += price
	Inventory.items.clear()

func night_check():
	if daysleft == 0 and balance < quota:
		%Opera/realdaycity.visible = false
		%Opera/realnightcity.visible = true
		%Opera/realopera.visible = false
		%Opera/realnightopera.visible = true
		%Opera/realsun.visible = false
		%Opera/realmoon.visible = true
		return true
	else:
		%Opera/realdaycity.visible = true
		%Opera/realnightcity.visible = false
		%Opera/realopera.visible = true
		%Opera/realnightopera.visible = false
		%Opera/realsun.visible = true
		%Opera/realmoon.visible = false
		return false

func begin_level(time): #day or night
	Scene.changeTo("res://World.tscn")
	var player = load("res://Player.tscn")
	player.instantiate()
	player.position = Vector2.ZERO

func end_level():
	sell_items()
	night = night_check()
	if daysleft == 0:
		if night:
			Scene.changeTo("res://WeekStart.tscn")
		else:
			if balance >= quota:
				Scene.changeTo("res://WeekStart.tscn")
			else:
				Scene.changeTo("res://lose.tscn")

func game_loop_start():
	pass
