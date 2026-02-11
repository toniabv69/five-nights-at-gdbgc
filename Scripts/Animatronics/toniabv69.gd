extends Animatronic

var profile_picture = preload("res://Assets/Textures/ProfilePictures/toniabv69_profile_picture.png")

func _ready() -> void:
	$SendResponseTimer.wait_time = 1 + ((0.25 * ai_value) * (2 if CurrentNightData.hard_mode else 1))
	set_sprite("../../Camera/PlayerUI/Jumpscares/Toniabv69")
	jumpscare_audio_player = $Toniabv69Jumpscare
	
func apply_message_sent_effect(message):
	if CurrentNightData.current_limbo_pattern.has("pattern"):
		if message.get_message_text() == CurrentNightData.current_limbo_pattern["pattern"]:
			$SendResponseTimer.start()
	else:
		if message.get_message_text().contains("when"):
			jumpscare()
		
func _on_send_response_timer_timeout() -> void:
	var text_to_send = CurrentNightData.current_limbo_pattern["correct_key"]
	get_node("../../Camera/MonitorUI/DiscordUI/DirectMessages/ScrollContainer/VBoxContainer/Toniabv69").\
	send_message(text_to_send)
	
