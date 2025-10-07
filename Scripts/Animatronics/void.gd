extends Animatronic

func apply_monitor_close_effect():
	if randi_range(1, 30) > ai_value and get_node("../..").current_internet > 0:
		get_node("../../Office/EthernetCable").visible = true

func _physics_process(delta: float) -> void:
	if get_node("../../Office/EthernetCable").visible == true:
		get_node("../..").current_internet -= delta
		if get_node("../..").current_internet <= 0:
			get_node("../../Office/EthernetCable").visible = false
