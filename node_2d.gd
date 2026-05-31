extends Node2D



func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE



func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()


func _on_timer_timeout() -> void:
	$Intro.play()
	pass # Replace with function body.


func _on_katakana_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/katakana.tscn")
	pass # Replace with function body.


func _on_katakana_2_pressed() -> void:
	get_tree().quit()


func _on_hiragana_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/hiragana.tscn")

	pass # Replace with function body.
