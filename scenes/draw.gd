extends Node2D

@export var mouse_pos: Vector2 = Vector2(0.0,0.0)
@export var old_pos: Vector2 = Vector2(-1.0,-1.0)

@export var brush_size: float = 4.0

#https://docs.godotengine.org/en/stable/tutorials/rendering/viewports.html
#https://docs.godotengine.org/en/stable/classes/class_subviewport.html#class-subviewport-property-render-target-clear-mode


#https://docs.godotengine.org/en/stable/tutorials/rendering/viewports.html
func _ready():
	#var viewport: Viewport = get_viewport()
	
	#viewport.set
	#$SubViewport.render_target_clear_mode = SubViewport.CLEAR_MODE_ONCE 
	#$SubViewport.render_target_update_mode = SubViewport.CLEAR_MODE_ONCE 
	#
	#$SubViewport.render_target_clear_mode = SubViewport.CLEAR_MODE_NEVER
	#$SubViewport.render_target_update_mode = SubViewport.CLEAR_MODE_NEVER 
	
	#$"..".render_target_clear_mode = SubViewport.CLEAR_MODE_NEVER
	#$"..".render_target_update_mode = SubViewport.CLEAR_MODE_NEVER 
	#$"..".render_target_clear_mode = SubViewport.CLEAR_MODE_ALWAYS
	#$"..".render_target_update_mode = SubViewport.CLEAR_MODE_ALWAYS 
	
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	

var _time_since_redraw = 0.0





func _on_katakana_button_down(text) -> void:
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

func _draw():
#	https://www.youtube.com/watch?v=nZvpg_OlqIk
	print("_draw")
	
	#draw_rect(Rect2(1.0, 1.0, 3.0, 3.0), Color.GREEN)
	#draw_rect(Rect2(5.5, 1.5, 2.0, 2.0), Color.GREEN, false, 1.0)
	#draw_rect(Rect2(9.0, 1.0, 5.0, 5.0), Color.GREEN)
	#draw_rect(Rect2(16.0, 2.0, 3.0, 3.0), Color.GREEN, false, 2.0)
	
#	get current mouse position.
# on click do something.
	#draw_rect(Rect2(mouse_pos, Vector2(brush_size, brush_size)), Color.RED)
	
	
	var antialiased = true
	draw_line(old_pos, mouse_pos, Color.WHITE, brush_size, antialiased)
	

	
	pass
