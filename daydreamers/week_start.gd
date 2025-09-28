extends Control


@onready var clipboard = $TextureRect
@onready var days = $TextureRect/Days
@onready var balance = $TextureRect/Balance
@onready var quota = $TextureRect/Quota

func _enter_tree() -> void:
	$TextureRect/Days.text = str(Game.daysleft)
	$TextureRect/Balance.text = "$" + str(Game.balance)
	$TextureRect/Quota.text = "$" + str(Game.quota)
