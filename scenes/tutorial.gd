extends Node

@export var duration: float = 5.0          # total time before scene ends
@export var fade_duration: float = 1.0     # how long before end to start fading
@export var fade_rect: ColorRect           # assign your ColorRect in the inspector

var _timer_running := true

func _ready() -> void:
	if fade_rect:
		fade_rect.modulate.a = 0.0
	await _run_timer()


# Core logic
func _run_timer() -> void:
	var elapsed := 0.0
	var fade_started := false

	while _timer_running and elapsed < duration:
		# Wait a frame
		await get_tree().process_frame
		elapsed += get_process_delta_time()

		# Check if "ui_next" key pressed
		if Input.is_action_just_pressed("ui_next"):
			break

		# Trigger fade at the right time
		if not fade_started and elapsed >= (duration - fade_duration):
			fade_started = true
			_start_fade()

	_end_scene()


func _start_fade() -> void:
	if not fade_rect:
		return
	
	var tween := create_tween()
	tween.tween_property(fade_rect, "modulate:a", 1.0, fade_duration)

func _end_scene() -> void:
	get_tree().change_scene_to_file("res://scenes/main.tscn")
