extends Control
class_name PlayerHud

@export var bottle_counter: Label
@export var temperature_bar: Label

func update_bottle_count(): 
	bottle_counter.text = str(PlayerData.bottles)
	
func update_temperature():
	pass 
