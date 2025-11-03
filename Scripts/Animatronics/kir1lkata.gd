extends Animatronic

func _ready():
	set_sprite("../../Camera/PlayerUI/Jumpscares/Kir1lkata")
	jumpscare_audio_player = $Kir1lkataJumpscare

func _on_timer_timeout() -> void:
	if randi_range(1, 30) < ai_value:
		kircho_rage()
		
func kircho_rage():
	$Kir1lkataRage.play()
	
func kircho_run():
	$Kir1lkataRunning.play()
	var tween = get_tree().create_tween()
	tween.tween_method(
		func(value):
			$Kir1lkataRunning.position.x = value,
			-75,
			0,
			2
		)
	tween.connect("finished", reset_running_player_position)
	
func reset_running_player_position():
	$Kir1lkataRunning.position.x = -75
	
func _on_kir_1_lkata_running_finished() -> void:
	if not get_node("../../Office/Door").is_closed:
		jumpscare()
	else:
		$Kir1lkataSlam.play()


func _on_kir_1_lkata_rage_finished() -> void:
	if not CurrentNightData.hard_mode:
		kircho_run()
	else:
		_on_kir_1_lkata_running_finished()
