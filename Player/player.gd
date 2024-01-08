extends CharacterBody2D

var speed := 150
var direccion := 0.0
var jump := 450
const gravity := 9
@onready var anim := $AnimationPlayer
@onready var sprite := $Sprite2D

func _physics_process(delta):
	direccion = Input.get_axis("ui_left","ui_right")
	velocity.x = direccion * speed
	
	if direccion != 0:
		anim.play("walk")
	else:
		anim.play("idle")
	
	sprite.flip_h = direccion < 0 if direccion != 0 else sprite.flip_h
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor() :
		#anim.play("jump")
		velocity.y -= jump

	elif !is_on_floor():
		velocity.y += gravity
		anim.play("jump")
	
	move_and_slide()
