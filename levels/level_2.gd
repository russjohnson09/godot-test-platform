extends "res://levels/level_1.gd"


@export var JUMP_SPEED = 300


func _ready():
	$Player.JUMP_SPEED = JUMP_SPEED
	var selected_str: String =  $OptionButton.get_item_text($OptionButton.selected)
	$Player.JUMP_SPEED = float(selected_str)

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


func _on_option_button_item_selected(index: int) -> void:
	var selected_str: String =  $OptionButton.get_item_text(index)
	$Player.JUMP_SPEED = float(selected_str)
	
	pass # Replace with function body.
