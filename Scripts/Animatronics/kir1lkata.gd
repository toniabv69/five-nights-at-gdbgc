extends Animatronic

var ai_value = 0

func _ready():
	set_sprite("../../Camera/PlayerUI/Kir1lkata")
	$AttackTimer.wait_time = 5 - ai_value * 0.15

func _on_timer_timeout() -> void:
	process_ai()

func process_ai():
	pass
