extends CanvasLayer

func _on_direct_messages_button_pressed() -> void:
	$DirectMessages.show()
	$ServerMessages.hide()

func _on_server_messages_button_pressed() -> void:
	$DirectMessages.hide()
	$ServerMessages.show()
