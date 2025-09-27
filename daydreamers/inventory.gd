extends CanvasLayer

var itempool = ["rocket", 
"apple", 
"box", 
"plank", 
"spring"]

var items = ["apple"]

func get_items(amount):
	for i in range(amount):
		var randnum = randi_range(0, 4)
		items.append(itempool[randnum])
