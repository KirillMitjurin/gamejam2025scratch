extends Control
	
	
@onready var image_rect: TextureRect = $"."
@onready var panels = [$pic1, $pic2, $pic3, $pic4]

var images =[preload("res://art/Comic/1.png"),
preload("res://art/Comic/2.png"),
preload("res://art/Comic/3.png"),
preload("res://art/Comic/4.png"),]

var current = 0 

func _ready() -> void:
	image_rect.texture = images[current]
	
	
func _input(event):
	if event.is_action_pressed("ui_accept"):
		current+=1
		if current < images.size():
			image_rect.texture = images[current]
		else:
			get_tree().change_scene_to_file("res://scenes/start_menu.tscn")

		
