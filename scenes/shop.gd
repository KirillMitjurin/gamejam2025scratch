extends Control


@onready var label_money = $VBoxContainer/MoneyLabel
@onready var label_message = $VBoxContainer/LabelMessage
@onready var speed_cost_label = $VBoxContainer/HBoxContainer/VBoxContainerSpeed/LabelCost
@onready var capacity_cost_label = $VBoxContainer/HBoxContainer/VBoxContainerCapacity/LabelCost

func _ready():
	update_ui()
	
func update_ui(): 
	label_money.text = "Money: %d" %PlayerData.money
	
func _on_close_button_pressed():
	hide()
