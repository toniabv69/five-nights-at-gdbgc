extends Camera3D

var is_moving = false

func _input(event):
	if not is_moving and event is InputEventKey:
		var tween = get_tree().create_tween()
		if event.is_action_pressed("Left"):
			is_moving = true
			tween.tween_property(self, "global_rotation_degrees", global_rotation_degrees + Vector3(0, 90, 0), 0.2)
		elif event.is_action_pressed("Right"):
			is_moving = true
			tween.tween_property(self, "global_rotation_degrees", global_rotation_degrees - Vector3(0, 90, 0), 0.2)
		elif event.is_action_pressed("Back"):
			is_moving = true
			tween.tween_property(self, "global_rotation_degrees", global_rotation_degrees + Vector3(0, 180, 0), 0.2)
		tween.connect("finished", clear_is_moving)
					
func clear_is_moving():
	is_moving = false
	
