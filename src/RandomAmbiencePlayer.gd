extends AudioStreamPlayer

@export var ambience_sounds: Array;
@export var timer: Timer;


func rand_timer_wait() -> void:
	timer.wait_time = randf_range(45, 80);


func _ready():
	rand_timer_wait();


func _on_ambience_timeout() -> void:
	var rand_ind = randi_range(0, ambience_sounds.size() - 1);
	stream = ambience_sounds[rand_ind];
	play();

	rand_timer_wait();
