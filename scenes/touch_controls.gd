extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_touch_screen_button_right_pressed() -> void:
	Input.action_press("move_right")

func _on_touch_screen_button_right_released() -> void:
	Input.action_release("move_right")

func _on_touch_screen_button_down_right_pressed() -> void:
	Input.action_press("move_right")
	Input.action_press("move_down_right")

func _on_touch_screen_button_down_right_released() -> void:
	Input.action_release("move_right")
	Input.action_release("move_down_right")

func _on_touch_screen_button_down_pressed() -> void:
	Input.action_press("move_down")

func _on_touch_screen_button_down_released() -> void:
	Input.action_release("move_down")

func _on_touch_screen_button_down_left_pressed() -> void:
	Input.action_press("move_left")
	Input.action_press("move_down_left")


func _on_touch_screen_button_down_left_released() -> void:
	Input.action_release("move_left")
	Input.action_release("move_down_left")


func _on_touch_screen_button_left_pressed() -> void:
	Input.action_press("move_left")


func _on_touch_screen_button_left_released() -> void:
	Input.action_release("move_left")


func _on_touch_screen_button_up_left_pressed() -> void:
	Input.action_press("move_up_left")
	Input.action_press("move_left")

func _on_touch_screen_button_up_left_released() -> void:
	Input.action_release("move_up_left")
	Input.action_release("move_left")

func _on_touch_screen_button_up_pressed() -> void:
	Input.action_press("move_up")

func _on_touch_screen_button_up_released() -> void:
	Input.action_release("move_up")

func _on_touch_screen_button_up_right_pressed() -> void:
	Input.action_press("move_up_right")
	Input.action_press("move_right")

func _on_touch_screen_button_up_right_released() -> void:
	Input.action_release("move_right")
	Input.action_release("move_up_right")
