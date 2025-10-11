extends Animatronic

func _ready():
	set_sprite("../../Camera/PlayerUI/Kir1lkata")
	$AttackTimer.wait_time = 5 - ai_value * 0.15

func _on_timer_timeout() -> void:
	if randi_range(1, 30) < ai_value:
		$AttackTimer.start()

func _on_attack_timer_timeout() -> void:
	if not get_node("../../Office/Door").is_closed:
		jumpscare()
