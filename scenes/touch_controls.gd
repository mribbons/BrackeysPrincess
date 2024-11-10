extends Node2D
@onready var sound_press: AudioStreamPlayer2D = $SoundButtonPress
@onready var sound_release: AudioStreamPlayer2D = $SoundButtonRelease
@onready var sound_dpad_press: AudioStreamPlayer2D = $SoundDpadPress
@onready var sound_dpad_release: AudioStreamPlayer2D = $SoundDpadRelease

var dpad_down_count: int = 0

const MOVE_RIGHT			= 0
const MOVE_DOWN_RIGHT	= 1
const MOVE_DOWN			= 2
const MOVE_DOWN_LEFT 	= 3
const MOVE_LEFT 			= 4
const MOVE_UP_LEFT 		= 5
const MOVE_UP 			= 6
const MOVE_UP_RIGHT 		= 7

var directions = Array([
	"move_right", 
	"move_down_right", 
	"move_down", 
	"move_down_left", 
	"move_left", 
	"move_up_left", 
	"move_up", 
	"move_up_right"
])

var press_counts = Array([
	0, 0, 0, 0, 0, 0, 0, 0
])


func handle_dpad_press(pressed_directions: Array[int]) -> void:
	if dpad_down_count == 0:
		sound_dpad_press.play()
		
	dpad_down_count += 1
	
	for direction in pressed_directions:
		press_counts[direction] += 1
		Input.action_press(directions[direction])
		print("press: ", directions[direction], ": " , press_counts[direction])

func handle_dpad_release(released_directions: Array[int]) -> void:
	dpad_down_count -= 1
	
	if dpad_down_count < 1:
		sound_dpad_release.play()
		
	for direction in released_directions:
		press_counts[direction] -= 1
		if press_counts[direction] < 0:
			press_counts[direction] = 0
		if press_counts[direction] < 1:
			Input.action_release(directions[direction])
			print("release: ", directions[direction], ": " , press_counts[direction])

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dpad_down_count = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_touch_screen_button_right_pressed() -> void:
	handle_dpad_press([MOVE_RIGHT])

func _on_touch_screen_button_right_released() -> void:
	handle_dpad_release([MOVE_RIGHT])

func _on_touch_screen_button_down_right_pressed() -> void:
	handle_dpad_press([MOVE_RIGHT, MOVE_DOWN_RIGHT])

func _on_touch_screen_button_down_right_released() -> void:
	handle_dpad_release([MOVE_RIGHT, MOVE_DOWN_RIGHT])

func _on_touch_screen_button_down_pressed() -> void:
	handle_dpad_press([MOVE_DOWN])

func _on_touch_screen_button_down_released() -> void:
	handle_dpad_release([MOVE_RIGHT])

func _on_touch_screen_button_down_left_pressed() -> void:
	handle_dpad_press([MOVE_LEFT, MOVE_DOWN_LEFT])


func _on_touch_screen_button_down_left_released() -> void:
	handle_dpad_release([MOVE_LEFT, MOVE_DOWN_LEFT])


func _on_touch_screen_button_left_pressed() -> void:
	handle_dpad_press([MOVE_LEFT])

func _on_touch_screen_button_left_released() -> void:
	handle_dpad_release([MOVE_LEFT])


func _on_touch_screen_button_up_left_pressed() -> void:
	handle_dpad_press([MOVE_UP_LEFT, MOVE_LEFT])

func _on_touch_screen_button_up_left_released() -> void:
	handle_dpad_release([MOVE_UP_LEFT, MOVE_LEFT])

func _on_touch_screen_button_up_pressed() -> void:
	handle_dpad_press([MOVE_UP])

func _on_touch_screen_button_up_released() -> void:
	handle_dpad_release([MOVE_UP])

func _on_touch_screen_button_up_right_pressed() -> void:
	handle_dpad_press([MOVE_UP_RIGHT, MOVE_RIGHT])

func _on_touch_screen_button_up_right_released() -> void:
	handle_dpad_release([MOVE_UP_RIGHT, MOVE_RIGHT])

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
