extends CanvasLayer
@onready var attack: TouchScreenButton = $Attack


func _on_attack_pressed() -> void:
	attack.modulate.a = 0.5


func _on_attack_released() -> void:
	attack.modulate.a = 1.0
