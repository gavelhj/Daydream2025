extends CanvasLayer

var itempool = ["rocket", 
"apple", 
"box", 
"plank", 
"spring"]

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

var theguioffset = 0

func load_items():
	for item in $HScrollBar.get_children():
		item.queue_free()
	var index = 0
	for item in items:
		var newitem = Items[item].duplicate()
		newitem.Position = Vector2(30 + index * 60, 41)

func update_items():
	theguioffset = $HScrollBar.value * 10
	pass

func _process(delta: float) -> void: #update inventory HUD
	pass
