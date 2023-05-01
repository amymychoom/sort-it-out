extends Node2D
class_name Package

# Need to connect signal programmatically because packages will be instanced
@onready var GSM: GameStateManager = get_tree().get_first_node_in_group("gsm");

@export var data_creator: PackageDataCreator;

@export_group("Debug")
@export var label: RichTextLabel;

var is_bad_package: bool; 

signal player_decided_on_package(accepted: bool, is_bad: bool);
signal spawned();


func _ready() -> void:
	randomize();

	add_to_group("packages");
	connect("player_decided_on_package", GSM._on_player_decided);
	connect("spawned", GSM._on_player_spawned);

	# Just gonna randomly decide if this is a bad package
	if randi_range(0, 10) > 7:
		is_bad_package = true;
	else:
		is_bad_package = false;

	var data = data_creator.get_package_data();
	var text = "SENDER: " + data["sender"] + \
				",\nRECIP: " + data["recipient"] + \
				",\nRET: " + data["return_addr"] + \
				",\nTO: " + data["deliver_addr"];
	label.text = text;


func get_package_data() -> Dictionary:
	return data_creator.get_package_data();


# Probably not the best way to handle this but whatever
func accepted() -> void:
	emit_signal("player_decided_on_package", true, is_bad_package);
	# TODO: Call Some Exit Animation or Whatever
	remove_from_group("packages");
	queue_free();


# ^ ditto
func denied() -> void:
	emit_signal("player_decided_on_package", false, is_bad_package);
	# TODO: Call Some Exit Animation or Whatever
	remove_from_group("packages");
	queue_free();