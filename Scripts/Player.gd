extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

@onready var animated_sprite_2d = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction (-1, 0, or 1)
	var direction = Input.get_axis("move_left", "move_right")
		
	# Handle Animations
	if is_on_floor():
		if direction == 0: animated_sprite_2d.play("idle")
		else: animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("jump")
		
	# Calculate movement
	if direction:
		animated_sprite_2d.flip_h = false
		velocity.x = direction * SPEED
	else:
		animated_sprite_2d.flip_h = true
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
