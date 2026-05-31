extends Node2D

#https://docs.godotengine.org/en/stable/tutorials/rendering/viewports.html

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	

	$draw_area.text = ""
	print("ready")
	
#	https://docs.godotengine.org/en/4.4/getting_started/step_by_step/signals.html#connecting-a-signal-via-code
	for node in $".".get_children():
		if node.is_in_group("kana"):
			print(node)
			var button: Button = node
			var text = button.text
			button.pressed.connect(_on_katakana_button_down.bind(text))
		pass

var _time_since_redraw = 0.0


func _process(delta):
	_time_since_redraw += delta
	if _time_since_redraw > 0.0001:
		_time_since_redraw = 0.0
		queue_redraw()


var mouse_pos = Vector2(0.0,0.0)

var click = false

func _input(event):
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
#	https://docs.godotengine.org/en/4.4/tutorials/inputs/mouse_and_input_coordinates.html
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://node_2d.tscn")

	## Mouse in viewport coordinates.
	#if event is InputEventMouseButton:
		#click = event.pressed
		##print("Mouse Click/Unclick at: ", event.position)
	#elif event is InputEventMouseMotion:
		#print("Mouse Motion at: ", event.position)
		#mouse_pos = event.position
#
	## Print the size of the viewport.
	##print("Viewport Resolution is: ", get_viewport().get_visible_rect().size)



func _on_katakana_button_down(text) -> void:
	
	$Draw.clear()
	
	
	$AudioStreamPlayer.volume_db = 10.0
	
	var mp3_path = "res://assets/shorts/kana_lesson/" + text+ ".mp3"
	print(mp3_path)

	$AudioStreamPlayer.stream = load(mp3_path)
	$AudioStreamPlayer.play()
	
	$draw_area.text = text
	
	pass # Replace with function body.


func _on_katakana_2_pressed() -> void:
	get_tree().change_scene_to_file("res://node_2d.tscn")

	pass # Replace with function body.
	
	
#https://docs.godotengine.org/en/stable/tutorials/2d/custom_drawing_in_2d.html

#func _draw():
	#print("_draw")
	#
	##draw_rect(Rect2(1.0, 1.0, 3.0, 3.0), Color.GREEN)
	##draw_rect(Rect2(5.5, 1.5, 2.0, 2.0), Color.GREEN, false, 1.0)
	##draw_rect(Rect2(9.0, 1.0, 5.0, 5.0), Color.GREEN)
	##draw_rect(Rect2(16.0, 2.0, 3.0, 3.0), Color.GREEN, false, 2.0)
	#
##	get current mouse position.
## on click do something.
	#draw_rect(Rect2(mouse_pos, Vector2(50.0, 50.0)), Color.RED)

	
	pass
