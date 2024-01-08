extends CharacterBody2D

var speed := 100
var direccion := 0.0
var jump := 250
const gravity := 9


func _physics_process(delta):
	direccion = Input.get_axis("izq","der")
	velocity.x = direccion * speed
	
	if is_on_floor():
		if direccion !=0:
			$anim.play("walk")
		else:
			$anim.play("idle")
	else:
		if velocity.y <0 :
			$anim.play("jump1")
	
		else:
			$anim.play("fall")
		
	
	$anim.flip_h = direccion < 0 if direccion != 0 else $anim.flip_h
	
	if Input.is_action_just_pressed("saltar") and is_on_floor() :
		#$anim.play("jump")
		velocity.y -= jump

	elif !is_on_floor():
		velocity.y += gravity
		#$anim.play("jump")
	
	move_and_slide()
