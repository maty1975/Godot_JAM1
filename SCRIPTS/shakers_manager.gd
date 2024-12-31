extends Node2D

@export var camaras : Array[ShakerComponent2D]
@onready var rbplayer: RigidBody2D = $"../PLAYER"
signal SHEIK

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
	


func active_shaker():
	#if rbplayer.linear_velocity.y >=100:
	#if Input.is_action_just_released("Spacebar"):
		## aca el for recore la variable camaras y para ejecutar los shake de
		## cada camara esta la primera variable que dice camara, esa variable es la
		## que se usa para recorrer las camaras y a esa variable le aplicamos los shake
		for camara in camaras:
			if camara != null:
				camara.is_playing = true


func _on_sheik() -> void:
	active_shaker()
	
