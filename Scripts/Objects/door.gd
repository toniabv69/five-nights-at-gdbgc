extends Node3D

var is_closed = false

func _on_knob_hitbox_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.is_action_pressed("Interact"):
			is_closed = true
		elif event.is_action_released("Interact"):
			is_closed = false

func _on_knob_hitbox_mouse_exited() -> void:
	is_closed = false

func print_closed():
	print(is_closed)
