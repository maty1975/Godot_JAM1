extends RigidBody2D

@export var gravedad : int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("ui_up"):
		gravity_scale = -gravedad
	else:
		gravity_scale = gravedad
	pass
