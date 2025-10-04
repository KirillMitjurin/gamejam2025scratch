extends Control

@onready var main = $"../../"

func _on_resume_pressed() -> void:
	main.pauseMenu()


func _on_quit_pressed() -> void:
	main.pauseMenu()
	get_tree().change_scene_to_file("res://scenes/start_menu.tscn")
