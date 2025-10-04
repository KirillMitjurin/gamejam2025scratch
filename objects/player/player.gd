extends CharacterBody2D


@export_range(0, 200)var speed = 200.0
@export var jump_velocity = -400.0

@onready var player_sprite : Sprite2D = $PlayerSprite2D


func _process(delta: float) -> void:

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_velocity

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
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

	if velocity.x > 0:
		player_sprite.flip_h = true
	elif velocity.x < 0:
		player_sprite.flip_h = false
		
	#if abs(velocity.x) > 0:
	#	player_sprite.play("run")
	#else:
	#	player_sprite.play("idle")

	move_and_slide()
