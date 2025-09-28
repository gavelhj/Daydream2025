extends CanvasLayer

var itempool = ["rocket", 
"apple", 
"box", 
"plank", 
"trampoline"]

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


func _process(delta: float) -> void: #update inventory HUD
	pass
