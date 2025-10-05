extends Control


@onready var label_money = $MoneyLabel
@onready var label_message = $LabelMessage

@export var hats: Array[ShopItem] = []
@export var boots: Array[ShopItem] = []

func _ready():
	update_ui()
	
func update_ui(): 
	label_money.text = "Bottles: %d" %PlayerData.bottles
	
	for hat in hats:
		hat.hide()
	if (PlayerData.heat_upgrade < len(hats)):
		hats[PlayerData.heat_upgrade].show()
	
	for boot in boots:
		boot.hide()
	if (PlayerData.speed_upgrade < len(boots)):
		boots[PlayerData.speed_upgrade].show()
	
func _on_close_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	hide()
