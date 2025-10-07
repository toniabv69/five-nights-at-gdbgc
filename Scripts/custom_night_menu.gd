extends Node2D

var hard_mode: bool = false
var night_time: int = 360

func _on_hard_mode_checkbox_toggled(toggled_on: bool) -> void:
	hard_mode = toggled_on

func _on_set_all_20_button_button_down() -> void:
	for child in $Characters/GridContainer.get_children():
		child.set_ai(20)

func _on_set_all_0_button_button_down() -> void:
	for child in $Characters/GridContainer.get_children():
		child.set_ai(0)

func _on_start_button_button_up() -> void:
	CurrentNightData.hard_mode = hard_mode
	CurrentNightData.custom_night = true
	CurrentNightData.night_time = night_time
	for child in $Characters/GridContainer.get_children():
		CurrentNightData.ais[child.name] = child.get_ai()
	get_tree().change_scene_to_file("res://Scenes/Menus/night_start.tscn")
