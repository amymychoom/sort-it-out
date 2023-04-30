extends Node

var today: int = 1;
var quota: int = 5;

func next_day() -> void:
	today += 1;
	quota += 3;
	get_tree().change_scene_to_file("res://scenes/day_success_screen.tscn");


func game_over() -> void:
	get_tree().change_scene_to_file("res://scenes/day_failure_screen.tscn");