extends Node2D
class_name GameScene

@export var fade_rect: ColorRect
@onready var pause_menu = $CanvasLayer/PauseMenu
var paused = false

func _ready() -> void:
	pause_menu.hide()
	
	if fade_rect:
		fade_rect.modulate.a = 1.0
		create_tween().tween_property(fade_rect, "modulate:a", 0.0, 2.0)

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pauseMenu()

func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	
	paused = !paused
