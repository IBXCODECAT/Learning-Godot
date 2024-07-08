extends Node2D

const SPEED = 60
var direction = 1

# Raycasts
@onready var raycast_left = $Raycast_Left
@onready var raycast_right = $Raycast_Right

# Sprite + Graphics
@onready var animated_sprite_2d = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if(raycast_right.is_colliding()):
		direction = -1
		animated_sprite_2d.flip_h = true;
	
	if(raycast_left.is_colliding()):
		direction = 1
		animated_sprite_2d.flip_h = false;
		
	position.x += direction * SPEED * delta
