extends Label

@export var fade_delay: float = 0.5      # how long to wait before fading in
@export var fade_duration: float = 1.0   # how long the fade takes

func _ready():
	# Start fully transparent
	modulate.a = 0.0
	
	# Create tween
	var tween = create_tween()
	
	# Wait before starting the fade
	tween.tween_interval(fade_delay)
	
	# Fade alpha to 1.0 over fade_duration seconds
	tween.tween_property(self, "modulate:a", 1.0, fade_duration)
