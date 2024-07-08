extends Area2D

@onready var game_manager = %"Game Manager"
@onready var pickup_animation = $"Pickup Animation"

func _on_body_entered(body):
	game_manager.add_point()
	pickup_animation.play("pickup")
