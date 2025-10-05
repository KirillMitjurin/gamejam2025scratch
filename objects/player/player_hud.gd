extends Control
class_name PlayerHud

@export var bottle_counter: Label
@export var temperature_bar: Label
@onready var heat_bar = $temp/ProgressBar


func update_bottle_count(): 
	bottle_counter.text = str(PlayerData.bottles)

func update_heat_bar(localheat: int):
	heat_bar.value = localheat
	var cold = Color(0, 0.4, 1)  
	var hot = Color(1, 0, 0)      
	var t = clamp(localheat / 100.0, 0.0, 1.0)
	heat_bar.modulate = cold.lerp(hot, t)
	
func update_temperature(localheat: int):
	temperature_bar.text = str(localheat)
