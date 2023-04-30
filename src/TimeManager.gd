extends Node

@export var timer: Timer;

@export_group("Debug")
@export var label: RichTextLabel;

var time: int = 9;
var am_pm := "AM";

signal end_of_day();


func _on_timeout():
	time += 1;

	if time == 12:
		am_pm = "PM";

	if time > 12:
		time -= 12;
	
	if label != null:
		if time < 10:
			label.text = "[center]0" + str(time) + " " + am_pm;
		else:
			label.text = "[center]" + str(time) + " " + am_pm;
	
	if time == 5:
		emit_signal("end_of_day");