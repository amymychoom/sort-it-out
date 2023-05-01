extends CanvasLayer

@export var anim: AnimationPlayer;

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("show_intro");
