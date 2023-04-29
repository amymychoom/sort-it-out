extends Node2D


@export var data_creator: PackageDataCreator;

@export_group("Debug")
@export var label: RichTextLabel;

var is_bad_package: bool; 

signal player_decided_on_package(accepted: bool, is_bad: bool);


func _ready() -> void:
	randomize();

	# Just gonna randomly decide if this is a bad package
	if randi_range(0, 10) > 7:
		is_bad_package = true;
	else:
		is_bad_package = false;

	# =========== DEBUG ===================
	var data = data_creator.get_package_data();
	var text = "SENDER: " + data["sender"] + ", RECIP: " + data["recipient"] + ", RET: " + data["return_addr"] + ", TO: " + data["deliver_addr"] + ", BAD: " + str(is_bad_package);
	label.text = text;


# Probably not the best way to handle this but whatever
func accepted() -> void:
	emit_signal("player_decided_on_package", true, is_bad_package);
	call_deferred("queue_free");


func denied() -> void:
	emit_signal("player_decided_on_package", false, is_bad_package);
	call_deferred("queue_free");