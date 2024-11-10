extends Node

var score = 0
@onready var score_label: Label = %ScoreLabel
@onready var player_die_sound: AudioStreamPlayer2D = $Sounds/PlayerDieSound

func add_point():
	score += 1
	print("score: ", score)
	score_label.text = str(score) + " x coins :D"
 
func player_die():
	player_die_sound.play()
