extends Node

var score = 0

@onready var score_label = %"Score Label"

func add_point():
	score += 1
	
	score_label.text = str(score) + " Coins Found!"
