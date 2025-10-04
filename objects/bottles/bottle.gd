extends Area2D
class_name Bottle

enum bottle_type {plastic, glass, turbo}
@export var type: bottle_type = bottle_type.plastic

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("pickup_bottle"):
		match type:
			bottle_type.plastic:
				PlayerData.bottles += 1
				print("plastic")
			bottle_type.glass:
				PlayerData.bottles += 3
				print("glass")
			bottle_type.turbo:
				PlayerData.bottles += 5
				print("turbo")
		queue_free()
		body.pickup_bottle()
	
	pass # Replace with function body.
