extends CharacterBody2D

@onready var animplayer = $AnimationPlayer

var speed = 100
var jumpheight = 400
var friction = 15


func _handle_inputs(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
	else: #friction
		velocity.x = lerp(velocity.x, 0.0, friction * delta)
		
	if is_on_floor():
		if Input.is_action_pressed("ui_accept"):
			velocity.y -= jumpheight
	

func _physics_process(delta: float) -> void:
	_handle_inputs(delta)
	
	if not is_on_floor():
		velocity.y += Global.gravity * delta
		
	move_and_slide()
