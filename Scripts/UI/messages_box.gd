extends Control

const message_scene = preload("res://Scenes/UI/message.tscn")
@export var user: Node

func add_message(username: String, timestamp: String, message_text: String, profile_picture: Texture):
	var scroll_container = $Messages/ScrollContainer
	
	if scroll_container.get_v_scroll_bar().value == scroll_container.get_v_scroll_bar().max_value:
		scroll_container.set_deferred("scroll_vertical", scroll_container.get_v_scroll_bar().max_value)
	
	for child in get_node("../../ScrollContainer/VBoxContainer").get_children():
		if child.name == name:
			get_node("../../ScrollContainer/VBoxContainer").move_child(child, 0)	
	
	var message = message_scene.instantiate()
	var control = $Messages/ScrollContainer/VBoxContainer/Control
	scroll_container.get_node("VBoxContainer").remove_child(control)
	$Messages/ScrollContainer/VBoxContainer.add_child(message)
	message.set_username(username)
	message.set_timestamp(timestamp)
	message.set_message_text(message_text)
	message.set_profile_picture(profile_picture)
	$Messages/ScrollContainer/VBoxContainer.add_child(control)
	return message
	
func _on_textbox_text_submitted(new_text: String) -> void:
	$Textbox.clear()
	$Textbox.call_deferred("edit")
	var message = add_message(CurrentNightData.username, Utils.transform_current_time_to_timestamp(), new_text, CurrentNightData.profile_picture)
	user.animatronic.apply_message_sent_effect(message)

func receive_message(username: String, timestamp: String, message_text: String, profile_picture: Texture):
	add_message(username, timestamp, message_text, profile_picture)
	
