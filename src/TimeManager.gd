extends Node

@export var timer: Timer;

@export_group("Debug")
@export var label: RichTextLabel;

var time: int = 9;

signal end_of_day();


func _on_timeout():
	time += 1;

	if time > 12:
		time -= 12;
	
	if label != null:
		label.text = "[center]" + str(time);
	
	if time == 5:
		emit_signal("end_of_day");