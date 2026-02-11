extends CanvasLayer

func on_open():
	if get_node("../..").current_internet <= 0:
		$InternetSymbol.visible = true
		$DiscordUI.visible = false
	else:
		$InternetSymbol.visible = false
		$DiscordUI.visible = true
		
func _on_power_button_button_down() -> void:
	get_node("../..").close_monitor()

func _physics_process(_delta) -> void:
	$TimeLabel.text = Utils.transform_current_time_to_timestamp()
