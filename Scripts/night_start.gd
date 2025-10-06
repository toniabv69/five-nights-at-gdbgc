extends Node2D

func _ready():
	if CurrentNightData.custom_night:
		$NightLabel.text = "Custom Night"
	else:
		$NightLabel.text = "Night " + str(CurrentNightData.night_number)
	
	$TipLabel.text = Tips.tips[randi() % Tips.tips.size()]
	
func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://Scenes/night.tscn")
