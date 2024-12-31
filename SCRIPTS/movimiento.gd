extends RigidBody2D

@onready var ray_cast_2d_suelo: RayCast2D = $"RayCast2D suelo"
@onready var particle_left: CPUParticles2D = $particle_left
@onready var particle_right: CPUParticles2D = $particle_right
#@onready var shakers_manager: Node2D = $"../Shakers_manager"
@onready var animation_tree: AnimationTree = $AnimationTree




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
	#print(linear_velocity)
	if Input.is_action_pressed("ui_left"):
		set_axis_velocity(-movement)
		particle_right.emitting = true
	else:
		particle_right.emitting = false
	
	
	if Input.is_action_pressed("ui_right"):
		set_axis_velocity(movement)
		particle_left.emitting = true
	else:
		particle_left.emitting = false
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
		#print(saltando)
		activar_salto()
	else:
		desactivar_salto()
		
		
func activar_salto():
	saltando = false
	act_anim_salto()
	#if linear_velocity.y >= 50:
		#print("SHAKY")

func desactivar_salto():
	saltando = true
	des_anim_salto()

func act_anim_salto():
	animation_tree["parameters/conditions/idle"] = true
	animation_tree["parameters/conditions/jumping"] = false
	
func des_anim_salto():
	animation_tree["parameters/conditions/jumping"] = true
	animation_tree["parameters/conditions/idle"] = false
	
