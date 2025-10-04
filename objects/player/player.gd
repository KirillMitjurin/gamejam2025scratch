extends CharacterBody2D

@export var hud: PlayerHud

@export_range(0, 200)var speed = 200.0
var anim
@onready var local_hotness = PlayerData.heat
@onready var player_sprite : AnimatedSprite2D = $PlayerSprite2D


func _physics_process(delta: float) -> void:

	#Movement implementation
	var h_direction := Input.get_axis("ui_left", "ui_right")
	if h_direction:
		velocity.x = h_direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	var v_direction := Input.get_axis("ui_up", "ui_down")
	if v_direction:
		velocity.y = v_direction * speed
	else:
		velocity.y = move_toward(velocity.y, 0, speed)
	
	
	local_hotness -= delta
	if local_hotness <= 0:
		get_tree().change_scene_to_file("res://scenes/shopUI.tscn")	
	# Player ANIMATION
	anim = "idle"
	
	if velocity != Vector2.ZERO:
		if abs(velocity.x) > abs(velocity.y):
			if velocity.x > 0:
				anim = "walking_right"
			else:
				anim = "walking_left"
		else:
			if velocity.y > 0:
				anim = "walking_down"
			else:
				anim = "walking_up"

	player_sprite.play(anim)

	move_and_slide()
	
func pickup_bottle():
	hud.update_bottle_count() 
