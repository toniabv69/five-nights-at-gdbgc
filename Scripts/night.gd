extends Node3D

var time: float = 0.0
var night_length: int = 5
var night_ended: bool = false

func _ready():
	$Animatronics/Kir1lkata.jumpscare()

func _physics_process(delta: float) -> void:
	time += delta
	if time >= night_length - 0.15:
		dim_camera()
	$Camera/PlayerUI.set_time(time, night_length)

func end_night():
	night_ended = true

func dim_camera():
	var dim_tween = get_tree().create_tween()
	dim_tween.tween_method(
		func(value):
			%Camera.environment.tonemap_exposure = value,
		%Camera.environment.tonemap_exposure,
		0,
		0.15
	)
	dim_tween.connect("finished", end_night)

func _on_timer_timeout() -> void:
	$AttackTimer.start()
