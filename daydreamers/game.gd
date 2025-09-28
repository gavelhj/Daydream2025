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
		return true
	else:
		return false

func end_level(success):
	if success:
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
