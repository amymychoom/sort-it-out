extends Node2D


func _on_continue() -> void:
	get_tree().change_scene_to_file("res://scenes/start_game_screen.tscn");
