extends Control

var ai_value = 0
@export var sprite: Texture2D

func _ready():
	$Sizer/Panel/TextureRect.texture = sprite

func update_label():
	$Sizer/Panel/Label.text = str(ai_value)

#func _on_panel_gui_input(event: InputEvent) -> void:
	#if event is InputEventMouseButton:
		#if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			#ai_value += 1 if ai_value < 20 else 0
		#elif event.button_index == MOUSE_BUTTON_RIGHT and event.is_pressed():
			#ai_value -= 1 if ai_value > 0 else 0
		#elif event.button_index == MOUSE_BUTTON_MIDDLE and event.is_pressed():
			#ai_value = 20
		#update_label()

func set_ai(value):
	if value >= 0 and value <= 20:
		ai_value = value
		update_label()

func get_ai():
	return ai_value

func _on_ai_down_button_down() -> void:
	set_ai(ai_value - 1)
		
func _on_ai_up_button_down() -> void:
	set_ai(ai_value + 1)
