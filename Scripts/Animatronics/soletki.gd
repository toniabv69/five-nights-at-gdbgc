extends Animatronic

var attacking = false

func apply_monitor_close_effect():
	if randi_range(1, 30) < ai_value and not attacking:
		$AttackTimer.start()
		get_node("../../Camera/PlayerUI/Animatronics/Soletki").visible = true
		attacking = true

func _ready():
	if CurrentNightData.hard_mode:
		$AttackTimer.wait_time /= 2
	set_sprite("../../Camera/PlayerUI/Jumpscares/Soletki")
	jumpscare_audio_player = $SoletkiJumpscare

func _on_attack_timer_timeout() -> void:
	if not get_node("../../Office/Door").is_closed or (false if not CurrentNightData.hard_mode else get_node("../../Camera/PlayerUI/Animatronics/Soletki").visible):
		jumpscare()
	else:
		$SoletkiKnocking.play()
		attacking = false
		get_node("../../Camera/PlayerUI/Animatronics/Soletki").visible = false
