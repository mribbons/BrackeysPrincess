extends Area2D

@onready var timer: Timer = $Timer
@onready var game_manager: Node = get_tree().get_first_node_in_group("GameManager")

func _on_body_entered(body: Node2D) -> void:
	print("You died! ")
	Engine.time_scale = 0.5
	body.get_node(("CollisionShape2D")).queue_free()
	timer.start()
	game_manager.player_die()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
