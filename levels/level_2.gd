extends "res://levels/level_1.gd"





func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
	if event.is_action_pressed("ui_restart_level"):
		#get_tree().reload_current_scene()
		get_tree().change_scene_to_file("res://levels/level2.tscn")

		


func _on_texture_button_pressed() -> void:
	
	pass # Replace with function body.


func _on_player_screen_exited() -> void:
	get_tree().reload_current_scene()
	pass # Replace with function body.
