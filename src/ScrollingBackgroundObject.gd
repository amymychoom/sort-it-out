extends Sprite2D

@export var move_speed: float;

# We want relative mouse movement in order to move... relative to the mouse movement
var mouse_relative: Vector2;


func _process(delta: float) -> void:
	position.x -= mouse_relative.x * move_speed * float(delta);
	position.y -= mouse_relative.y * (move_speed / 2) * float(delta);
	mouse_relative = Vector2();


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		mouse_relative = event.relative;