extends Node3D

func _ready() -> void:
	undim_camera()
	$AnimationPlayer.play("camera_animation")
	$Office/Clock/Cube.rotation_degrees = Vector3(-90, 0, 0)
	$Office/Clock/Cube_001.rotation_degrees = Vector3(0, 0, 0)
	$Office/Clock/Cube_002.rotation_degrees = Vector3(-342, 0, 0)

func _physics_process(delta: float) -> void:
	$Office/Clock/Cube_002.rotation_degrees -= Vector3(6 * delta, 0, 0)

func undim_camera():
	var dim_tween = get_tree().create_tween()
	dim_tween.tween_method(
		func(value):
			$Camera.environment.tonemap_exposure = value,
		$Camera.environment.tonemap_exposure,
		1,
		2
	)
	dim_tween.connect("finished", dim_camera)
	
func dim_camera():
	await get_tree().create_timer(3).timeout
	var dim_tween = get_tree().create_tween()
	dim_tween.tween_method(
		func(value):
			$Camera.environment.tonemap_exposure = value,
		$Camera.environment.tonemap_exposure,
		0,
		3
	)
	dim_tween.connect("finished", go_back_to_menu)
	
func go_back_to_menu():
	get_tree().change_scene_to_file("res://Scenes/Menus/custom_night_menu.tscn")
