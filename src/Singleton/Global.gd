extends Node

var today: int = 1;
var quota: int = 7;

var success_packages: int;
var failed_packages: int;

func next_day() -> void:
	today += 1;
	quota += 7;
	get_tree().change_scene_to_file("res://scenes/day_success_screen.tscn");


func game_over() -> void:
	get_tree().change_scene_to_file("res://scenes/day_failure_screen.tscn");