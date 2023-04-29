extends Node2D

var current_package: Package;


func _ready() -> void:
	get_next_package();


func get_next_package() -> void:
	# There will only be one package on screen at a time, so this works fine
	current_package = get_tree().get_first_node_in_group("packages");


func _on_deny_button_up() -> void:
	if current_package == null:
		get_next_package();
	current_package.denied();


func _on_accept_button_up() -> void:
	if current_package == null:
		get_next_package();
	current_package.accepted();
