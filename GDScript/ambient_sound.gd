extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SodaAudioManager.play_ambient_sound("res://sonido/Ambient/Dark Cave.wav", true)

func _process(delta: float) -> void:
	
	pass
