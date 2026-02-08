extends Animatronic

var profile_picture = preload("res://Assets/Textures/ProfilePictures/martin_profile_picture.png")

func apply_message_sent_effect(message):
	if not $AttackTimer.is_stopped():
		if message.get_message_text() != CurrentNightData.current_limbo_pattern["correct_key"]:
			jumpscare()
		else:
			$AskTimer.start()

func _ready():
	if(CurrentNightData.hard_mode):
		$AskTimer.wait_time = 0

func _on_ask_timer_timeout() -> void:
	if randi_range(1, 30) < ai_value:
		send_message()

func send_message():
	var text_to_send = LimboSpreadsheet.set_random_pattern()
	get_node("../../Camera/MonitorUI/DiscordUI/DirectMessages/Messages/Martin").\
	receive_message("Martin", Utils.transform_current_time_to_timestamp(),\
	text_to_send, profile_picture)
	$AttackTimer.start()
	$AskTimer.stop()
	
