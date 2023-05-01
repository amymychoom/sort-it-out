extends Node2D

@export var anim: AnimationPlayer;


func _ready() -> void:
	anim.play("end_of_day");
	await anim.animation_finished;

	if Global.success_packages > Global.quota:
		Global.next_day();
	else:
		Global.game_over();
