extends RigidBody2D

@onready var ray_cast_2d_suelo: RayCast2D = $"RayCast2D suelo"

var movement : Vector2
var gravedad_default : int
@export var gravedad : int = 8

var saltando : bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	gravedad_default = gravedad
	movement.x = 800
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	print(saltando)
	if Input.is_action_pressed("ui_left"):
		set_axis_velocity(-movement)
		
	elif Input.is_action_pressed("ui_right"):
		set_axis_velocity(movement)
		
	salto()
	rayo()

func salto():
	if Input.is_action_just_pressed("Spacebar"):
		if (saltando == false):
			apply_impulse(Vector2(0,-2000))
			gravity_scale = gravedad
	elif Input.is_action_just_released("Spacebar"):
		if (saltando ==true):
			gravity_scale = gravedad * 4
		
func rayo():
	if ray_cast_2d_suelo.is_colliding():
		gravity_scale = gravedad_default
		print(saltando)
		activar_salto()
	else:
		desactivar_salto()
		
func activar_salto():
	saltando = false

func desactivar_salto():
	saltando = true
