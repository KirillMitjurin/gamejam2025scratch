extends Node2D

@export var bottle_prefabs : Array[PackedScene]
var random = RandomNumberGenerator.new()
	
func get_random_position(size) -> Vector2:
	random.randomize()
	var x = random.randf_range(-abs(size/2), abs(size/2))
	var y = random.randf_range(-abs(size/2), abs(size/2))
	return Vector2(x, y)

func _on_timer_timeout() -> void:
	if get_child_count() < 3:
		var index = random.randi_range(0, bottle_prefabs.size() - 1)
		var bottle = bottle_prefabs[index].instantiate()
		#bottle.position = position
		add_child(bottle)
