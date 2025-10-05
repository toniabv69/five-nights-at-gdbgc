extends Node3D

var time: float = 0.0
var night_length: int = 360

func _ready():
	$Animatronics/Kir1lkata.jumpscare()

func _physics_process(delta: float) -> void:
	time += delta
	if time >= night_length:
		end_night()
	$Camera/PlayerUI.set_time(time, night_length)

func end_night():
	pass

func _on_timer_timeout() -> void:
	$AttackTimer.start()
