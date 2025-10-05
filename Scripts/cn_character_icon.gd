extends Control

var ai_value = 0
@export var sprite: Texture2D

#func _on_button_gui_input(event: InputEvent) -> void:
	#if event is InputEventMouseButton:
		#if event.keycode == MOUSE_BUTTON_LEFT:
			#ai_value += 1 if ai_value < 20 else 0
		#elif event.keycode == MOUSE_BUTTON_RIGHT:
			#ai_value -= 1 if ai_value > 0 else 0
		#elif event.keycode == MOUSE_BUTTON_MIDDLE:
			#ai_value = 20
		#update_label()

func _ready():
	$Panel/TextureRect.texture = sprite

func update_label():
	$Panel/Label.text = str(ai_value)

func _on_panel_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			ai_value += 1 if ai_value < 20 else 0
		elif event.button_index == MOUSE_BUTTON_RIGHT and event.is_pressed():
			ai_value -= 1 if ai_value > 0 else 0
		elif event.button_index == MOUSE_BUTTON_MIDDLE and event.is_pressed():
			ai_value = 20
		update_label()

func set_ai(value):
	if value >= 0 and value <= 20:
		ai_value = value
		update_label()
