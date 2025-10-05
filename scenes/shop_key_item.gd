extends TextureButton

@export var item_name = ""
@export var cost = 0

@export var message_label: Label
@export var shop_ui: Control

func _ready():
	_on_hover_exit()
	connect("mouse_entered", Callable(self, "_on_hover"))
	connect("mouse_exited", Callable(self, "_on_hover_exit"))
	connect("pressed", Callable(self, "_on_pressed"))

func _on_hover(): 
	message_label.text = "Cost: %d" % [cost]
	
func _on_hover_exit():
	message_label.text = item_name
	
func _on_pressed():
	if PlayerData.bottles >= cost:
		PlayerData.bottles -= cost
		get_tree().change_scene_to_file("res://scenes/finalComics.tscn")
		
		hide()
		
	else:
		message_label.text = "Not enough bottles"
