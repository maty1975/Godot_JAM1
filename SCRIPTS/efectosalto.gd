extends Area2D

@onready var rbplayer: RigidBody2D = $".."
@onready var particula_suelo: CPUParticles2D = $"../particula suelo"
@onready var shakers_manager: Node2D = $Shakers_manager ## al final no creo que lo use, intentare otra cosa
@onready var shaker_ref: ShakerComponent2D = $PhantomCamera2D/ShakerComponent2D





func _on_area_entered(area: Area2D) -> void:
	
	if rbplayer.linear_velocity.y <= 1000:
		SodaAudioManager.play_snd_player("res://sonido/SFX/afterjump.wav")
		#shaker_ref.play_shake()
		#shakers_manager.emit_signal("SHEIK", self, "_on_sheik")
		particula_suelo.emitting = true
		
