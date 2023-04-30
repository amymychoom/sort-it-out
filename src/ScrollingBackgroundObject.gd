extends Sprite2D

@export var move_speed: float;

# We want relative mouse movement in order to move... relative to the mouse movement
var mouse_relative: Vector2;


func _ready() -> void:
	mouse_relative = Vector2();
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED;


func _process(delta: float) -> void:
	mouse_relative.clamp(Vector2(-10, -10), Vector2(10, 10));
	position.x -= mouse_relative.x * move_speed * float(delta);
	position.y -= mouse_relative.y * (move_speed / 2) * float(delta);
	mouse_relative = Vector2();


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		mouse_relative = event.relative;
