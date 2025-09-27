extends CanvasLayer

@onready var Music = $Music
@onready var Sound = $Sound
@onready var Menu = $Menu

func _on_sound_pressed() -> void: #sound
	Global.sound = !Global.sound
	if Global.sound == false:
		Sound.icon = load("res://mute-icon.png")
	else:
		Sound.icon = load("res://volume-icon.png")

func _on_music_pressed() -> void: #music
	Global.music = !Global.music
	if Global.music == false:
		Music.icon = load("res://no-music-icon.png")
	else:
		Music.icon = load("res://music-icon.png")

func _on_menu_pressed() -> void: #menu
	Scene.changeTo("res://GameStart.tscn")

func enlarge(icon):
	icon.scale = Vector2(0.11, 0.11)
func ensmallen(icon):
	icon.scale = Vector2(0.1, 0.1)

func _on_music_mouse_entered() -> void:
	enlarge(Music)

func _on_music_mouse_exited() -> void:
	ensmallen(Music)


func _on_sound_mouse_entered() -> void:
	enlarge(Sound)

func _on_sound_mouse_exited() -> void:
	ensmallen(Sound)


func _on_menu_mouse_entered() -> void:
	enlarge(Menu)

func _on_menu_mouse_exited() -> void:
	ensmallen(Menu)
