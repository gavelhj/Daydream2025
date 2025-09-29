extends CanvasLayer
#we didnt finish in time so here is the old item pool
var itempool = ["rocket", "apple", "box", "plank", "trampoline"]
#var itempool = ["apple","apple","apple","apple","apple"]

var items = []
var itemprices = {
	apple = 100,
	box = 100,
	rocket = 200,
	trampoline = 150,
	plank = 150
}

func get_items(amount):
	for i in range(amount):
		var randnum = randi_range(0, 4)
		items.append(itempool[randnum])
