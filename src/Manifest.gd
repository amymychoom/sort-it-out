extends PackageDataCreator

@export var label: RichTextLabel;

var current_package: Package;


func _ready() -> void:
	randomize();
	#get_next_package();
	display_package_manifest();


func get_next_package() -> void:
	# There will only be one package on screen at a time, so this works fine
	current_package = get_tree().get_first_node_in_group("packages");


func display_package_manifest() -> void:
	if current_package == null:
		get_next_package();
	if current_package.is_bad_package:
		randomize();
		var field_to_fudge = get_rand_in_dict(current_package.get_package_data());
		current_package.get_package_data()[field_to_fudge] = get_some_name() if field_to_fudge == "sender" || field_to_fudge == "recipient" else get_some_address(); 
	
	label.text = "Sender: " + current_package.get_package_data()["sender"] + " Recipient: " + current_package.get_package_data()["recipient"] + " Delivery Address: " + current_package.get_package_data()["deliver_addr"] + " Return Address: " + current_package.get_package_data()["return_addr"];


func get_rand_in_dict(dict: Dictionary) -> String:
	var a = dict.keys();
	a = a[randi() % a.size()];
	return a;
