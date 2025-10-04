extends Node


var speed := 200 
var money := 200
var bottles := 0 
var heat := 20

var upgrades = {
	"speed": 0,
	"heat": 0
}

func buy_upgrade(upgrade_name: String, cost:int, value_increase: int):
	if money >= cost:
		money -= cost
		upgrades[upgrade_name] += 1 
		match upgrades:
			"speed":
				speed += value_increase
			"heat":
				heat += value_increase
		return true
	return false; 	
