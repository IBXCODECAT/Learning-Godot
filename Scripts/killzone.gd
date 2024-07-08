extends Area2D

@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print("You Died!")
	
	# Slow down game on death
	Engine.time_scale = 0.5
	
	# Remove the player's collider to make it fall off the map
	body.get_node("CollisionShape2D").queue_free();
	
	# Start a timer to trigger a reload of the level after some time
	timer.start()


func _on_timer_timeout():
	get_tree().reload_current_scene()
	
	# Reset game time to default speed
	Engine.time_scale = 1
