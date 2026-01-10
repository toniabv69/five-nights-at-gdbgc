extends Node3D

var time: float = 0.0
var night_number: int = 1
var night_length: int = 360
var night_ended: bool = false
var hard_mode: bool = false
var custom_night: bool = true
var max_internet: float = 10
var current_internet: float = max_internet
var in_monitor: bool = false

func _ready():
	if custom_night:
		$Camera/PlayerUI/NightLabel.text = "Custom Night"
		$Camera/PlayerUI/NightLabel.position.x -= 80
	else:
		$Camera/PlayerUI/NightLabel.text = "Night " + str(night_number)
	
	night_number = CurrentNightData.night_number
	night_length = CurrentNightData.night_time
	hard_mode = CurrentNightData.hard_mode
	custom_night = CurrentNightData.custom_night
	max_internet = CurrentNightData.max_internet
	current_internet = max_internet
	
	for child in $Animatronics.get_children():
		child.ai_value = CurrentNightData.ais[child.name]
		
		for user_child in $Camera/MonitorUI/DiscordUi/DirectMessages/ScrollContainer/VBoxContainer.get_children():
			if child.name == user_child.name:
				user_child.animatronic = child
		
func _physics_process(delta: float) -> void:
	time += delta
	CurrentNightData.time_elapsed = time
	if time >= night_length - 0.15:
		dim_camera()
	$Camera/PlayerUI.set_time(time, night_length)

func end_night():
	night_ended = true

func game_over():
	#TODO: create game over scene
	get_tree().change_scene_to_file("res://Scenes/Menus/custom_night_menu.tscn")

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

func get_in_monitor():
	return in_monitor

func open_monitor():
	in_monitor = true
	%Camera.move_forward()

func close_monitor():
	%Camera/MonitorUI.visible = false
	%Camera.move_backward()
	for child in $Animatronics.get_children():
		if child.has_method("apply_monitor_close_effect"):
			child.apply_monitor_close_effect()
	
func finish_opening_monitor():
	%Camera/MonitorUI.visible = true
	%Camera/MonitorUI.on_open()
	%Camera.clear_is_moving()

func finish_closing_monitor():
	in_monitor = false
	%Camera.clear_is_moving()
