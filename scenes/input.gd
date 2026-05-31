extends Node2D



#https://www.youtube.com/watch?v=nZvpg_OlqIk
#func _process(delta):
	#_time_since_redraw += delta
	#if _time_since_redraw > 0.0001:
		#_time_since_redraw = 0.0
		#queue_redraw()


var old_pos = Vector2(-10.0,-10.0)
var mouse_pos = Vector2(0.0,0.0)

var click = false

@export var brush_size: float = 5.0

@export var drawer: Node2D


func _ready() -> void:
	drawer.brush_size = brush_size

func clear():
	$SubViewport.render_target_clear_mode = SubViewport.CLEAR_MODE_ONCE

func do_redraw():
	drawer.mouse_pos = mouse_pos
	if old_pos.x < 0.0:
		old_pos = mouse_pos
	drawer.old_pos = old_pos
	drawer.queue_redraw()
	old_pos = drawer.mouse_pos


func _input(event):
	#Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
#	https://docs.godotengine.org/en/4.4/tutorials/inputs/mouse_and_input_coordinates.html
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://node_2d.tscn")

	# Mouse in viewport coordinates.
	#if (event is InputEventMouseButton) or 
	if (event is InputEventScreenTouch) or (event is InputEventMouseButton):
		click = event.pressed
		#event.is_pressed()
		#print("Mouse Click/Unclick at: ", event.position)
		#if event.pressed():
			#do_redraw()
		if not click:
			old_pos = Vector2(-1,-1)

	elif event is InputEventMouseMotion:
		print("Mouse Motion at: ", event.position)
		mouse_pos = event.position
		if click:
			do_redraw()
