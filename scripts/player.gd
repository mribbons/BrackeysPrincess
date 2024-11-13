extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

@onready var node_2d: Node2D = $Node2D
@onready var animated_sprite: AnimatedSprite2D = $Node2D/AnimatedSprite2D
@onready var sword_collision_shape_2d: CollisionShape2D = $Node2D/SwordHit/CollisionShape2D
@onready var jump_sound: AudioStreamPlayer2D = $JumpSound
var dead = false

var attacking = false
var attack_delta = 0
const ATTACK_TICKS = 0.1

func _on_ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() and !dead:
		velocity.y = JUMP_VELOCITY
		jump_sound.play()

	if Input.is_action_just_pressed("fire") and !dead:
		if !attacking:
			attacking = true
			#$AnimatedSprite2D/SwordHit/CollisionShape2D.disabled = false
			sword_collision_shape_2d.disabled = false
			animated_sprite.play("attack")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if dead:
		direction = 0
	
	if direction and !dead:
		# sets orientation of everything under node_2d by setting scale.x to -1 or 1
		node_2d.scale.x = direction
	
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

func die():
	dead = true
	sword_collision_shape_2d.set_deferred("disabled", true)
	attacking = false

func _on_sword_hit_area_entered(area: Area2D) -> void:
	# prevent lockup after death sequence, problem might be fixed by moving timer code up in KillZone._on_body_entered()
	if dead:
		return
	if area.is_in_group("enemy_killzone"):
		area.owner.call_deferred('take_damage')


func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite.animation == "attack":
		sword_collision_shape_2d.disabled = true
		attacking = false
