extends Node
class_name GameStateManager

@export var package_scene: PackedScene;
@export var manifest: PackageDataCreator;
@export var selector: Node2D;


var package_spawn_pos : Vector2;

var failed_packages: int;
var packages_cleared: int;


func _ready() -> void:
	var pkg = get_tree().get_first_node_in_group("packages");
	package_spawn_pos = pkg.position;


func _on_player_decided(player_accepted_package: bool, package_is_bad: bool) -> void:
	# TODO: Cleanup
	# The player accepted the package and it was bad
	if player_accepted_package && package_is_bad:
		failed_packages += 1;
	# The player denied the package and it was good
	elif !player_accepted_package && !package_is_bad:
		failed_packages += 1;
	
	packages_cleared += 1;

	# Tell the gsm to take a quick breather so the package has time to delete itself before spawning a new package
	var time = get_tree().create_timer(0.1);
	await time.timeout;
	_on_player_spawned();


func day_over() -> void:
	var successful_packages = packages_cleared - failed_packages;
	Global.success_packages = successful_packages;
	Global.failed_packages = failed_packages;
	get_tree().change_scene_to_file("res://scenes/end_of_day_screen.tscn");


func _on_player_spawned() -> void:
	var pack = package_scene.instantiate();
	pack.position = package_spawn_pos;
	get_parent().add_child(pack);

	selector.current_package = null;
	manifest.current_package = null;
	
	selector.get_next_package();
	manifest.get_next_package();
	manifest.display_package_manifest();
