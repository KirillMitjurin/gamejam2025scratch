extends Control
	
@export var fade_rect: ColorRect  # drag your black overlay here
@onready var image_rect: TextureRect = $"."
@onready var panels = [$pic1, $pic2, $pic3, $pic4]

var current = 0
@export var auto_timer = 4.0  # seconds between images
@export var fading_time = 0.8 # fade in/out duration

var images =[preload("res://art/Comic/1.png"),
preload("res://art/Comic/2.png"),
preload("res://art/Comic/3.png"),
preload("res://art/Comic/4.png"),]

func _ready() -> void:
	image_rect.texture = images[current]
	
	if fade_rect:
		fade_rect.modulate.a = 1.0  # start fully black
		# Fade in first image
		var tween = create_tween()
		tween.tween_property(fade_rect, "modulate:a", 0.0, fading_time)
	
	# Start automatic slideshow after fade-in
	_start_next_image_timer()


func _start_next_image_timer():
	var t = get_tree().create_timer(auto_timer)
	t.timeout.connect(_next_image)


func _next_image():
	current += 1
	if current >= images.size():
		get_tree().change_scene_to_file("res://scenes/start_menu.tscn")
		return
	
	if fade_rect:
		fade_rect.modulate.a = 0.0
		var tween = create_tween()
		tween.tween_property(fade_rect, "modulate:a", 1.0, fading_time)  # fade to black
		tween.tween_callback(func():
			image_rect.texture = images[current]  # change image mid-fade
			var tween2 = create_tween()
			tween2.tween_property(fade_rect, "modulate:a", 0.0, fading_time)  # fade back to transparent
		)
	else:
		image_rect.texture = images[current]
	
	_start_next_image_timer()


func _input(event):
	pass # skip to next image on key press
