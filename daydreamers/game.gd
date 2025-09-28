extends Node

@onready var balance = 0
@onready var quota = 700
@onready var daysleft = 5
@onready var night = false
@onready var week = 0

func sell_items():
	for item in Inventory.items:
		Global.money += Inventory.itemprices[item]
	Inventory.items.clear()

func night_check():
	if daysleft <= 0 and balance < quota:
		return 0 #night
	else:
		return 1 #day

func end_level(success):
	if success:
		sell_items()
	daysleft -= 1
	if balance >= quota:
			Scene.changeTo("res://WeekStart.tscn")
			week += 1
			balance = 0
			quota =  700 + 200 * week
	if daysleft <= 0:
		if night_check() == 1:
			Scene.changeTo("res://lose.tscn")
		elif night == false:
			night = true
			Scene.changeTo("res://WeekStart.tscn")
		else:
			Scene.changeTo("res://lose.tscn")
	else:
		Scene.changeTo("res://WeekStart.tscn")
