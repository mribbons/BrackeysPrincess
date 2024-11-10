extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var jump_sound: AudioStreamPlayer2D = $JumpSound

var attacking = false
var attack_delta = 0
const ATTACK_TICKS = 0.1


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_sound.play()

	if Input.is_action_just_pressed("fire"):
		if !attacking:
			attacking = true
			animated_sprite.play("attack")
	elif attacking:
		attack_delta += delta
		
		if attack_delta >= ATTACK_TICKS:
			attacking = false
			attack_delta = 0
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	if (direction > 0):
		animated_sprite.flip_h = false
	elif (direction < 0):
		animated_sprite.flip_h = true
	
	if !attacking:
		if is_on_floor():
			# play animations
			if direction == 0:
				animated_sprite.play("idle")
			else:
				animated_sprite.play("run")
		else:
			animated_sprite.play("jump")
	
	
	# applies movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
