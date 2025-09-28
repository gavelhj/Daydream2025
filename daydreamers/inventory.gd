extends CanvasLayer

var itempool = ["rocket", 
"apple", 
"box", 
"plank", 
"spring"]

var items = []

func get_items(amount):
	for i in range(amount):
		var randnum = randi_range(0, 4)
		items.append(itempool[randnum])

func update_items():
	pass

func _process(_delta: float) -> void: #update inventory HUD
	for item in items:
		pass
