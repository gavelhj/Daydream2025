extends Control


@onready var clipboard = $TextureRect
@onready var days = $TextureRect/Days
@onready var balance = $TextureRect/Balance
@onready var quota = $TextureRect/Quota

func _enter_tree() -> void:
	$TextureRect/Days.text = str(Game.daysleft)
	$TextureRect/Balance.text = "$" + str(Game.balance)
	$TextureRect/Quota.text = "$" + str(Game.quota)


func _on_shiftbutton_pressed() -> void:
	Scene.changeTo("res://World.tscn")
	Inventory.get_items(3 + Game.week * 2)
	Game.quota = 700 + 200 * Game.week


func _on_shiftbutton_mouse_entered() -> void:
	$TextureRect/Shift.scale = Vector2(1.1, 1.1)


func _on_shiftbutton_mouse_exited() -> void:
	$TextureRect/Shift.scale = Vector2(1.0, 1.0)
