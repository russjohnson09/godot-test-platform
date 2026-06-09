extends Node2D



func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
	#if event.is_action_pressed("ui_restart_level"):
		##get_tree().reload_current_scene()
		#get_tree().change_scene_to_file("res://levels/level2.tscn")
