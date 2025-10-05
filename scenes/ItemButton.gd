extends TextureButton
class_name ShopItem

@export var item_name = ""
@export var cost = 0
@export var speed_bonus_percent = 0
@export var heat_bonus_percent = 0

@export var message_label: Label
@export var shop_ui: Control
@export var next_item: ShopItem

func _ready():
	_on_hover_exit()
	connect("mouse_entered", Callable(self, "_on_hover"))
	connect("mouse_exited", Callable(self, "_on_hover_exit"))
	connect("pressed", Callable(self, "_on_pressed"))

func _spec_text() -> String:
	var text = ""
	if (speed_bonus_percent != 0):
		text = "Speed bonus: %d%%" % [speed_bonus_percent]
	if (heat_bonus_percent != 0):
		text = "Heat bonus: %d%%" % [heat_bonus_percent]
	return text

func _on_hover(): 
	message_label.text = "Cost: %d\n%s" % [cost, _spec_text()]
	
func _on_hover_exit():
	message_label.text = item_name + "\n" + _spec_text()
	
func _on_pressed():
	if PlayerData.bottles >= cost:
		PlayerData.bottles -= cost
		
		if (speed_bonus_percent != 0):
			PlayerData.speed_multiplier = 1 + speed_bonus_percent / 100.0;
			message_label.text = "%s purchased! New speed: %d%%" % [item_name, 100 + speed_bonus_percent]
		if (heat_bonus_percent != 0):
			PlayerData.heat_multiplier = 1 + heat_bonus_percent / 100.0;
			message_label.text = "%s purchased! New heat: %d%%" % [item_name, 100 + heat_bonus_percent]
			
		if shop_ui:
			shop_ui.update_ui()
		
		if next_item:
			next_item.show()
		hide()
			
		
	else:
		message_label.text = "Not enough bottles"
