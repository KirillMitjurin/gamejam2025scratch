extends TextureButton

@export var item_name = ""
@export var price = 0
@export var speed_bonus = 0
@export var heat_bonus = 0
@export var texture: Texture2D

@export var message_label: Label
@export var shop_ui: Control 



func _ready():
	connect("mouse_entered", Callable(self, "_on_hover"))
	connect("mouse_exited", Callable(self, "_on_hover_exit"))
	connect("pressed", Callable(self, "_on_pressed"))
	#
	#if texture: 
		#icon = texture
		#expand_icon = true
	

func _on_hover(): 
	if message_label:
		message_label.text = "name: %s, price: %d" % [item_name, price]
	
func _on_hover_exit():
	if message_label:
		message_label.text = ""
	
func _on_pressed(): 
	if PlayerData.money >= price:
		PlayerData.money -= price
		PlayerData.speed += speed_bonus
		PlayerData.heat += heat_bonus
		if message_label:
			message_label.text = " %s is purchased, now speed %d %d" % [item_name, PlayerData.speed, PlayerData.heat]
		
		if shop_ui:
			shop_ui.update_ui()
	else:
		if message_label:
			message_label.text = "Not enough money"
