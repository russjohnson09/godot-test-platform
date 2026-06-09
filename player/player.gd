extends CharacterBody2D

const WALK_FORCE = 600
const WALK_MAX_SPEED = 200
const STOP_FORCE = 1300
@export var JUMP_SPEED = 300

const PUSH_FORCE = 80.0

signal screen_exited

@onready var gravity := float(ProjectSettings.get_setting("physics/2d/default_gravity"))

#@export var combat_actor: PackedScene

#@export var input_scene: PackedScene = preload("res://levels/input.tscn")

#var input = input_scene.instantiate()

@export var input: Node2D

func _physics_process(delta: float) -> void:
	var walk_direction: float = input.get_axis_x()
	# Horizontal movement code. First, get the player's input.
	var walk := WALK_FORCE * walk_direction
	# Slow down the player if they're not trying to move.
	if abs(walk) < WALK_FORCE * 0.2:
		# The velocity, slowed down a bit, and then reassigned.
		velocity.x = move_toward(velocity.x, 0, STOP_FORCE * delta)
	else:
		velocity.x += walk * delta
	# Clamp to the maximum horizontal movement speed.
	velocity.x = clamp(velocity.x, -WALK_MAX_SPEED, WALK_MAX_SPEED)

	# Vertical movement code. Apply gravity.
	velocity.y += gravity * delta

	# Move based on the velocity and snap to the ground.
	# TODO: This information should be set to the CharacterBody properties instead of arguments: snap, Vector2.DOWN, Vector2.UP
	# TODO: Rename velocity to linear_velocity in the rest of the script.
	move_and_slide()
	
	if is_on_floor():
	#	https://github.com/godotrecipes/character_vs_rigid/blob/master/player.gd#L4
		for i in get_slide_collision_count():
			var c = get_slide_collision(i)
			if c.get_collider() is RigidBody2D:
				c.get_collider().apply_central_impulse(-c.get_normal() * PUSH_FORCE)

	# Check for jumping. is_on_floor() must be called after movement code.
	if is_on_floor() and input.is_action_just_pressed(&"jump"):
		velocity.y = -JUMP_SPEED


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	emit_signal("screen_exited")
	pass # Replace with function body.
