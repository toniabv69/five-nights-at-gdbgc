extends Control

var liked = false

func set_username(username: String):
	$NameLabel.text = username
	
func set_timestamp(timestamp: String):
	$TimeLabel.text = timestamp

func set_message_text(message_text: String):
	$MessageLabel.text = message_text
	
func set_profile_picture(profile_picture: Texture):
	$MeshInstance2D/Image.texture = profile_picture

func get_message_text():
	return $MessageLabel.text

func _on_button_pressed() -> void:
	DisplayServer.clipboard_set($MessageLabel.text)

func like():
	liked = not liked
	$HeartIcon.visible = not $HeartIcon.visible

func _on_heart_button_pressed() -> void:
	like()
