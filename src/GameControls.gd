extends Node2D

@export var pause_menu: CanvasLayer;


func _ready() -> void:
	pause_menu.visible = false;


func _input(_event) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().paused = !get_tree().paused;
		pause_menu.visible = !pause_menu.visible;
	
	if get_tree().paused && Input.is_action_just_pressed("ui_accept"):
		get_tree().quit();
