extends Control

const message_scene = preload("res://Scenes/UI/message.tscn")
@export var user: Node

func add_message(username: String, timestamp: String, message_text: String, profile_picture: Texture):
	var message = message_scene.instantiate()
	$Messages/ScrollContainer/VBoxContainer.add_child(message)
	message.set_username(username)
	message.set_timestamp(timestamp)
	message.set_message_text(message_text)
	message.set_profile_picture(profile_picture)
	return message
	
func _on_textbox_text_submitted(new_text: String) -> void:
	$Textbox.clear()
	var message = add_message(CurrentNightData.username, Utils.transform_current_time_to_timestamp(), new_text, CurrentNightData.profile_picture)
	#user.animatronic.apply_message_sent_effect(message)

func receive_message(username: String, timestamp: String, message_text: String, profile_picture: Texture):
	add_message(username, timestamp, message_text, profile_picture)
	for child in get_node("../../ScrollContainer/VBoxContainer").get_children():
		if child.name == name:
			move_child(child, 0)
