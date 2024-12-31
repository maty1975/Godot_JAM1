extends Area2D

@onready var rbplayer: RigidBody2D = $".."
@onready var particula_suelo: CPUParticles2D = $"../particula suelo"


func _on_area_entered(area: Area2D) -> void:
	#if rbplayer.linear_velocity.y <= 10:
		particula_suelo.emitting = true
