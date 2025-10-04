extends AudioStreamPlayer

@export var playlist: Array[AudioStream] = []
var current_index: int

func _ready():
	if playlist.size() == 0:
		print("Playlist is empty!")
		return
	
	play_tracks()

func play_tracks():
	current_index = -1
	while playlist.size() > 0:
		current_index += 1
		current_index %= playlist.size()

		stream = playlist[current_index]
		play()
		
		var duration = stream.get_length() + 1
		await get_tree().create_timer(duration).timeout
