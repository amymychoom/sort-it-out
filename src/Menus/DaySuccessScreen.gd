extends Node2D

@export var success_label: RichTextLabel;


func _ready() -> void:
	if Global.failed_packages > 0:
		success_label.text = "What a successful day! \n\nYou passed " + str(Global.success_packages) + \
							" packages, but you also passed " + str(Global.failed_packages) + " packages that shouldn't have been passed. 
							\nYou can do better.";
	else:
		success_label.text = "What a successful day! \n\nYou passed " + str(Global.success_packages) + \
							" packages, and you did it without passing a single bad package! Congratulations!";

func _on_continue() -> void:
	Global.success_packages = 0;
	Global.failed_packages = 0;
	get_tree().change_scene_to_file("res://scenes/start_game_screen.tscn");
