extends Node
class_name Animatronic

@export var ai_value: int
@export var sprite: Sprite2D
@export var jumpscare_audio_player: AudioStreamPlayer3D

func jumpscare():
	if get_node("../..").in_monitor:
		get_node("../..").close_monitor()
	sprite.visible = true
	jumpscare_audio_player.play()
	jumpscare_audio_player.connect("finished", get_node("../..").game_over)

func set_sprite(path: String):
	sprite = get_node(path)
	
