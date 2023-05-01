extends Node2D

@export var package_fade_anim: AnimationPlayer;

@export var audio_player: AudioStreamPlayer;
@export var accept_sound: AudioStream;
@export var deny_sound: AudioStream;

var current_package: Package;


func _ready() -> void:
	get_next_package();


func get_next_package() -> void:
	# There will only be one package on screen at a time, so this works fine
	current_package = get_tree().get_first_node_in_group("packages");


func _on_deny_button_up() -> void:
	package_fade_anim.play("black_flash");
	audio_player.stream = deny_sound;
	audio_player.play();
	var time = get_tree().create_timer(0.06);
	await time.timeout;

	if current_package == null:
		get_next_package();
	current_package.denied();


func _on_accept_button_up() -> void:
	package_fade_anim.play("black_flash");
	audio_player.stream = accept_sound;
	audio_player.play();
	var time = get_tree().create_timer(0.06);
	await time.timeout;

	if current_package == null:
		get_next_package();
	current_package.accepted();
