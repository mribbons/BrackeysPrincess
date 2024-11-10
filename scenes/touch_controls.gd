extends Node2D
@onready var sound_press: AudioStreamPlayer2D = $SoundButtonPress
@onready var sound_release: AudioStreamPlayer2D = $SoundButtonRelease
@onready var sound_dpad_press: AudioStreamPlayer2D = $SoundDpadPress
@onready var sound_dpad_release: AudioStreamPlayer2D = $SoundDpadRelease

var dpad_down_count: int = 0

func handle_dpad_press() -> void:
	if dpad_down_count == 0:
		sound_dpad_press.play()
		
	dpad_down_count = dpad_down_count + 1

func handle_dpad_release() -> void:
	dpad_down_count = dpad_down_count - 1
	
	if dpad_down_count < 1:
		sound_dpad_release.play()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dpad_down_count = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_touch_screen_button_right_pressed() -> void:
	Input.action_press("move_right")
	handle_dpad_press()

func _on_touch_screen_button_right_released() -> void:
	Input.action_release("move_right")
	handle_dpad_release()

func _on_touch_screen_button_down_right_pressed() -> void:
	Input.action_press("move_right")
	Input.action_press("move_down_right")
	handle_dpad_press()

func _on_touch_screen_button_down_right_released() -> void:
	Input.action_release("move_right")
	Input.action_release("move_down_right")
	handle_dpad_release()

func _on_touch_screen_button_down_pressed() -> void:
	Input.action_press("move_down")
	handle_dpad_press()

func _on_touch_screen_button_down_released() -> void:
	Input.action_release("move_down")
	handle_dpad_release()

func _on_touch_screen_button_down_left_pressed() -> void:
	Input.action_press("move_left")
	Input.action_press("move_down_left")
	handle_dpad_press()


func _on_touch_screen_button_down_left_released() -> void:
	Input.action_release("move_left")
	Input.action_release("move_down_left")
	handle_dpad_release()


func _on_touch_screen_button_left_pressed() -> void:
	Input.action_press("move_left")
	handle_dpad_press()

func _on_touch_screen_button_left_released() -> void:
	Input.action_release("move_left")
	handle_dpad_release()


func _on_touch_screen_button_up_left_pressed() -> void:
	Input.action_press("move_up_left")
	Input.action_press("move_left")
	handle_dpad_press()

func _on_touch_screen_button_up_left_released() -> void:
	Input.action_release("move_up_left")
	Input.action_release("move_left")
	handle_dpad_release()

func _on_touch_screen_button_up_pressed() -> void:
	Input.action_press("move_up")
	handle_dpad_press()

func _on_touch_screen_button_up_released() -> void:
	Input.action_release("move_up")
	handle_dpad_release()

func _on_touch_screen_button_up_right_pressed() -> void:
	Input.action_press("move_up_right")
	Input.action_press("move_right")
	handle_dpad_press()

func _on_touch_screen_button_up_right_released() -> void:
	Input.action_release("move_right")
	Input.action_release("move_up_right")
	handle_dpad_release()


func _on_touch_screen_button_outer_circle_pressed() -> void:
	Input.vibrate_handheld(300, 0.75)

func _on_touch_screen_button_outer_circle_released() -> void:
	pass # Replace with function body.

func _on_touch_screen_button_a_pressed() -> void:
	sound_press.play()


func _on_touch_screen_button_a_released() -> void:
	sound_release.play()


func _on_touch_screen_button_b_pressed() -> void:
	sound_press.play()


func _on_touch_screen_button_b_released() -> void:
	sound_release.play()
