extends Node3D

func _on_static_body_3d_input_event(camera: Node, event: InputEvent, event_position: Vector3, normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.is_action_pressed("Interact"):
			visible = false
			var night = get_node("../..")
			if night.hard_mode and night.current_internet > 0:
				night.max_internet = night.current_internet
			else:
				night.current_internet = night.max_internet
