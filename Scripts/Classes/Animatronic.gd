extends Node
class_name Animatronic

@export var ai_value: int
@export var sprite: Sprite2D

func jumpscare():
	sprite.visible = true

func set_sprite(path: String):
	sprite = get_node(path)
