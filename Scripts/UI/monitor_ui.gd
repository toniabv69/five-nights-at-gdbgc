extends CanvasLayer

func on_open():
	if get_node("../..").current_internet <= 0:
		$InternetSymbol.visible = true
		$DiscordUi.visible = false
	else:
		$InternetSymbol.visible = false
		$DiscordUi.visible = true
		
func _on_power_button_button_down() -> void:
	get_node("../..").close_monitor()
	$DiscordUi.visible = false

func _physics_process(_delta) -> void:
	$TimeLabel.text = Utils.transform_current_time_to_timestamp()
