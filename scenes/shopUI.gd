extends Control


@onready var label_money = $MoneyLabel
@onready var label_message = $LabelMessage

func _ready():
	update_ui()
	
func update_ui(): 
	label_money.text = "Bottles: %d" %PlayerData.bottles
	
func _on_close_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main.tscn")
	hide()
