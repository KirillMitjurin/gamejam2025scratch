extends Node


var player_speed := 200 
var player_money := 0
var player_bottles := 0 
var player_heat := 20

var upgrades = {
	"speed": 0,
	"heat": 0
}

func buy_upgrade(upgrade_name: String, cost:int, value_increase: int):
	if player_money >= cost:
		player_money -= cost
		upgrades[upgrade_name] += 1 
		match upgrades:
			"speed":
				player_speed += value_increase
			"heat":
				player_heat += value_increase
		return true
	return false; 	
