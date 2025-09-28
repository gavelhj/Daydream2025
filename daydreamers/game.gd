extends Node

@onready var balance = 0
@onready var quota = 700
@onready var daysleft = 5
@onready var night = false
@onready var week = 1

func sell_items():
	for item in Inventory.items:
		#Global.money += price
		pass
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

func end_level():
	sell_items()
	daysleft -= 1
	night = night_check()
	if balance >= quota:
			Scene.changeTo("res://WeekStart.tscn")
			week += 1
	if daysleft == 0:
		if balance < quota:
			Scene.changeTo("res://lose.tscn")

func game_loop_start():
	pass
