extends CanvasLayer

func on_open():
	if get_node("../..").current_internet <= 0:
		$InternetSymbol.visible = true

func _on_power_button_button_down() -> void:
	get_node("../..").close_monitor()
