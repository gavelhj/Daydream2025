extends CharacterBody2D
#hi if you dont understand anything then do COMMAND + CLICK

@onready var animplayer = $AnimationPlayer
@onready var sprite = $Sprite2D
@onready var jumpsound = $jumpsound

var speed = 100
var jumpheight = 100
var friction = 15

var coyote = 0
var maxcoyote = 3

var alpha = 0
var cycle = 0.25
var cycledirection = 1 #make it rotate the other way

func eject_apple():
	var apple = Scene.summon("res://Apple.tscn")
	var main = get_tree().get_root().get_node("World")
	apple.position = position
	apple.rotation = 0
	main.add_child.call_deferred(apple)

func animate(direction, delta):

	if velocity.y:
		sprite.rotation = lerp(sprite.rotation, velocity.x * 0.005, delta)
	else:
		if direction:
			alpha = alpha + delta * cycledirection * -direction # so like basically alpha is
			#the time that has passed for the animation
			
			sprite.rotation = fmod(alpha, cycle) * 4
			
			if absf(alpha) > cycle - 0.2: #go other way
				cycledirection = -cycledirection #turn other way
		else: #continue until alpha zero like the chess engine
			if not absf(alpha) <= 0.1:
				alpha = alpha + delta * cycledirection
				sprite.rotation = fmod(alpha, cycle) * 3
			else:
				alpha = 0
				sprite.rotation = 0
				cycledirection = 1
		#sprite.offset.y = -alpha*100 * cycledirection # make the guy hop
		sprite.offset.y = -alpha*10000 * alpha
		
func apply_friction(direction, delta):
	if not direction:
		velocity.x = lerp(velocity.x, 0.0, friction * delta)
	if absf(velocity.x) < 10:
		velocity.x = 0

func handle_inputs(_delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction: #if press a then return -1 and d is 1 and both is 0
		velocity.x = direction * speed
		
	if coyote <= maxcoyote: #see if they are on the floor
		if Input.is_action_pressed("ui_accept"):
			velocity.y -= jumpheight #jump up
	else:
		if Input.is_action_just_pressed("ui_accept"):
			if 'apple' in Inventory.items:
				velocity.y = -jumpheight * 4
				Inventory.items.erase('apple')
				eject_apple()
	return direction #direction u moving in

func _physics_process(delta: float) -> void:
	var direction = handle_inputs(delta)
	apply_friction(direction, delta)
	animate(direction, delta)
	
	if not is_on_floor():
		coyote += 1
		velocity.y += Global.gravity * delta
	else:
		coyote = 0
		
	move_and_slide()
