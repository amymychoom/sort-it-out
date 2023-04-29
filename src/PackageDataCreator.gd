extends Node
class_name PackageDataCreator

var package_data = {
	"sender": "",
	"recipient": "",
	"return_addr": "",
	"deliver_addr": "",
	# etc
};

var f_names = [
	"John",
	"Bradley",
	"Goose",
	"Benny",
	"Rebecca",
	"Flint",
	"Emma",
	"Abby",
	"Jonesy"
];

var l_names = [
	"Smith",
	"Lint",
	"Lockwood",
	"Nite",
	"Realman",
	"Pahkedge",
	"Benson",
	"Edwards"
];

var streets = [
	"Wood",
	"1st",
	"2nd",
	"81st",
	"831st",
	"Broad",
	"Long",
	"Wide",
	"Fast",
	"Pahkedge",
	"Pennsylvania",
	"Garbage",
];

var street_types = [
	"Road",
	"Ave.",
	"Way",
	"Street",
	"Parkway",
];


func get_package_data() -> Dictionary:
	return package_data;


func _ready() -> void:
	randomize();
	generate_package_data();

	# ====== DEBUG =======
	#for field in package_data:
	#	print(package_data[field]);


func generate_package_data() -> void:
	for field in package_data:
		match field:
			"sender":
				package_data[field] = get_some_name();
			"recipient":
				package_data[field] = get_some_name();
			"return_addr":
				package_data[field] = get_some_address();
			"deliver_addr":
				package_data[field] = get_some_address();
			_:
				package_data[field] = "junk";


func get_some_name() -> String:
	var f_ind = randi_range(0, f_names.size() - 1);
	var l_ind = randi_range(0, l_names.size() - 1);

	return f_names[f_ind] + " " + l_names[l_ind];


func get_some_address() -> String:
	var s_ind = randi_range(0, streets.size() - 1);
	var st_ind = randi_range(0, street_types.size() - 1);

	var house_num = str(randi_range(100, 2000));

	return house_num + " " + streets[s_ind] + " " + street_types[st_ind];

