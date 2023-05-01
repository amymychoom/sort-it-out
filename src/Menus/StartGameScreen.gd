extends Node2D

# TODO: Turn this into an animation

@export var label: RichTextLabel;
@export var quota_label: RichTextLabel;
@export var audio: AudioStreamPlayer;


func _ready() -> void:
	audio.play();
	label.text = "[center]9AM - Day " + str(Global.today);
	quota_label.text = "[center] Quota: " + str(Global.quota) + " Packages Delivered Successfully.";
	await audio.finished;
	_on_timeout();


func _on_timeout() -> void:
	@warning_ignore("integer_division")
	Input.warp_mouse(Vector2(1920/2, 1080/2));

	# fucking giga brain moment right here
	# i've been having an issue where if the mouse moves in between changing scene and the scene loading
	# can cause the background and objects to go off screen and reveal the clear color behind.
	# this only really happened if the magnitude of movement was very high,
	# usually it just resulted in a noticeable offset.  
	# the solution? snap the mouse to the center of the screen before changing the scene. 

	# that didn't work on it's own though, so I simply just told the game to wait 1/10th of a second after snapping the mouse
	# in the hopes that the player thinks there's a reason the mouse snapped and doesn't touch anything
	var time = get_tree().create_timer(0.1);
	await time.timeout;
	get_tree().change_scene_to_file("res://scenes/game.tscn");
