extends Animatronic

var profile_picture = preload("res://Assets/Textures/ProfilePictures/martin_profile_picture.png")

func apply_message_sent_effect(message):
	if not $AttackTimer.is_stopped():
		if message.get_message_text() != CurrentNightData.current_limbo_pattern["correct_key"]:
			jumpscare()
		else:
			$AttackTimer.stop()

func _ready():
	if CurrentNightData.hard_mode:
		$AskTimer.wait_time = 0
	$AttackTimer.wait_time = 30 - (0.75 * ai_value)
	set_sprite("../../Camera/PlayerUI/Jumpscares/Martin")
	#TODO: get a new jumpscare sound for martin
	jumpscare_audio_player = $MartinJumpscare

func _on_ask_timer_timeout() -> void:
	if randi_range(1, 30) < ai_value and $AttackTimer.is_stopped():
		send_message()
	
func _on_attack_timer_timeout() -> void:
	jumpscare()

func send_message():
	var text_to_send = LimboSpreadsheet.set_random_pattern()["pattern"]
	get_node("../../Camera/MonitorUI/DiscordUI/DirectMessages/ScrollContainer/VBoxContainer/Martin").\
	send_message(text_to_send)
	$AttackTimer.start()
	
