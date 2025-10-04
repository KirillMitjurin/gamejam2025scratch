extends CharacterBody2D


@export_range(0, 200)var speed = 200.0
@export var jump_velocity = -400.0

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
	
	# Player ANIMATION
	
	if velocity.y < 0:
		player_sprite.play("walking_up")
	elif velocity.y > 0:
		player_sprite.play("walking_down")
	elif velocity.x < 0:
		player_sprite.play("walking_left")
	elif velocity.x > 0:
		player_sprite.play("walking_right")
		
	
	
	if velocity.x == 0 and velocity.y == 0:
		player_sprite.play("idle")

	move_and_slide()
