extends Area2D
class_name Bottle

enum bottle_type {plastic, glass, turbo}
@export var type: bottle_type = bottle_type.plastic

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("pickup_bottle"):
		match type:
			bottle_type.plastic:
				print("plastic")
			bottle_type.glass:
				print("glass")
			bottle_type.turbo:
				print("turbo")
	queue_free()
	pass # Replace with function body.
