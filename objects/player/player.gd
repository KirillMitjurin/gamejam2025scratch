extends CharacterBody2D

@export var pick_bottle: AudioStream
@export var footsteps: AudioStream
@export var hud: PlayerHud

var footsteps_player: AudioStreamPlayer

@export_range(0, 200) var base_speed = 150.0
@onready var speed = base_speed * PlayerData.speed_multiplier

@onready var local_hotness = 20 * PlayerData.heat_multiplier

var rng = RandomNumberGenerator.new()

var anim
var was_idle = true
@onready var player_sprite : AnimatedSprite2D = $PlayerSprite2D

func _ready() -> void:
	footsteps_player = SfxPlayer.play_sound(self, footsteps)
	footsteps_player.stop()
	footsteps_player.volume_db += 15

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
	
	
	
	hud.update_temperature(local_hotness)
	hud.update_heat_bar(local_hotness)
	if local_hotness <= 0:
		stop_footsteps()
		var tree := get_tree()
		player_sprite.play("freezing")
		await player_sprite.animation_finished
		tree.change_scene_to_file("res://scenes/shopUI.tscn")	
	else:
		local_hotness -= delta
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
		
		if (was_idle): play_footsteps()
		was_idle = false
	else:
		if (!was_idle): stop_footsteps()
		was_idle = true

	player_sprite.play(anim)

	move_and_slide()

func play_footsteps():
	footsteps_player.volume_db = 15
	footsteps_player.play(rng.randf_range(2.0, 10.0))

func stop_footsteps():
	var tween = create_tween()
	tween.tween_property(footsteps_player, "volume_db", -80.0, 0.1)

func pickup_bottle():
	hud.update_bottle_count() 
	var player: AudioStreamPlayer = SfxPlayer.play_sound(self, pick_bottle)
	player.pitch_scale = rng.randf_range(0.95, 1.02)
	player.play(0.15)
