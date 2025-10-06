extends Node3D

var time: float = 0.0
var night_number: int = 1
var night_length: int = 360
var night_ended: bool = false
var hard_mode: bool = false
var custom_night: bool = true

func _ready():
	#$Animatronics/Kir1lkata.jumpscare()
	if custom_night:
		$Camera/PlayerUI/NightLabel.text = "Custom Night"
		$Camera/PlayerUI/NightLabel.position.x -= 80
	else:
		$Camera/PlayerUI/NightLabel.text = "Night " + str(night_number)
	
	night_number = CurrentNightData.night_number
	night_length = CurrentNightData.night_time
	hard_mode = CurrentNightData.hard_mode
	custom_night = CurrentNightData.custom_night
	
		
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
