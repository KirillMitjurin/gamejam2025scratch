extends Node

func play_sound(target_node: Node, audio_stream: AudioStream, autoplay: bool = true) -> AudioStreamPlayer:
	var player = AudioStreamPlayer.new()    
	target_node.add_child(player)
	
	player.bus = "SFX"
	player.stream = audio_stream
	if (autoplay):
		player.play()
	
	_free_audio_player(player, audio_stream)
	return player

func _free_audio_player(player: AudioStreamPlayer, audio_stream: AudioStream):
	await get_tree().create_timer(audio_stream.get_length()).timeout
	if is_instance_valid(player):
		player.queue_free()	
