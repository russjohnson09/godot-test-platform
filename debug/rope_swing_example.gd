extends Node2D


# rotate a ray based on the rotation on the controller or keyboard.



# soccer ball can create an association with a new object for the pinjoint
# this acts as the grapple.
# force is added to the ball based on player input.
func get_controller_rotation():
	
	pass


func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
	if event.is_action_pressed("ui_restart_level"):
		get_tree().reload_current_scene()
		#get_tree().change_scene_to_file("res://levels/level2.tscn")


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_soccer_ball_3_grapple() -> void:
	
	if not $BigChallenges9/AudioStreamPlayer2D.playing:
		$BigChallenges9/AudioStreamPlayer2D.play()
		$BigChallenges9/AnimationPlayer.play("new_animation")
	pass # Replace with function body.


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	_on_soccer_ball_3_grapple()
	pass # Replace with function body.
