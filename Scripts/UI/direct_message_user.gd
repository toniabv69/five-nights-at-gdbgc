extends Control

@export var image_sprite: Texture
@export var username: String = ""
@export var animatronic: Animatronic

func _ready():
	$MeshInstance2D/Image.texture = image_sprite
	$Label.text = username

func get_profile_picture():
	return image_sprite
	
func get_username():
	return username

func get_animatronic():
	return animatronic
	
func _on_button_pressed() -> void:
	for child in get_node("../../../Messages").get_children():
		if child.name == name:
			child.show()
		else:
			child.hide()
	
