extends Control

var openedui = []

func _unhandled_key_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		if "Menu" in openedui:
			Scene.hideoverlay($Menu)
			openedui.erase("Menu")
		else:
			Scene.showoverlay($Menu)
			openedui.append("Menu")
			
	elif event.is_action_pressed("ui_focus_next"):
		Scene.showoverlay($Quota) #i built this function brick by brick
		$Quota/blackbackground/TextureRect/Balance.text = "$" + str(Game.balance)
		$Quota/blackbackground/TextureRect/Days.text = str(Game.daysleft)
		$Quota/blackbackground/TextureRect/Quota.text = "$" + str(Game.quota)
	elif event.is_action_released("ui_focus_next"):
		Scene.hideoverlay($Quota)
