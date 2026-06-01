extends Node2D




func get_axis_x():
	if $Right.is_pressed():
		return 1.0
	if $Left.is_pressed():
		return -1.0
	var val = (Input.get_axis(&"move_left", &"move_right"))
	#print(val)
	return val


func is_action_just_pressed(action: StringName, exact_match: bool = false):
	
	#print(action)
	
	if action == &"jump":
		if $Jump.is_pressed():
			return true
		#return $TextureButton.button_pressed
	
	return Input.is_action_just_pressed(action)
