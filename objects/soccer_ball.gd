extends RigidBody2D
#extends CharacterBody2D


@export var enable_player_control = false


@export var DEFAULT_SPEED = 300.0


#var pin_point = PinJoint2D.new()
var pin_point: PinJoint2D 

var grapple_rotation_degrees = 90

func add_grapple():
	"""Create a PinJoint and attach it to a static body."""
	var gd = $GrappleDetection
	if is_instance_valid(pin_point):
		return
	#gd.rotation_degrees = rotation_degrees + 90
	gd.rotation_degrees = (grapple_rotation_degrees) - rotation_degrees
	#print("grapple")
	##add_child(ray_cast)
	#call_deferred("add_child", ray_cast)
	var node: Node2D = $"."
	var parent = get_parent()
	#print(node)

	if gd.is_colliding():
		var collider = gd.get_collider()
		
		if collider is StaticBody2D:
			#print("collided", collider)
			#$PinJoint2D.node_b = collider
			#var node: Node2D = $"."
			#print(node)
			pin_point = PinJoint2D.new()
			
			
			pin_point.node_a = node.get_path()
			pin_point.node_b = collider.get_path()
			#pin_point.global_position = collider.position
			pin_point.global_position = collider.global_position
			print(collider, collider.position, collider.global_position)
			parent.add_child(pin_point)
			
			
			print(get_child_count())
			print(pin_point.position)
			print(pin_point.global_position)
			
			#print(pin_point.)

	pass

func _process(delta: float) -> void:
	
	if not enable_player_control:
		return
		
	if Input.is_action_pressed("move_right"):
		grapple_rotation_degrees = 270
		if Input.is_action_pressed("grapple_up"):
			grapple_rotation_degrees -= 45
			print(grapple_rotation_degrees)
		var speed = Vector2(DEFAULT_SPEED,0)
		if linear_velocity.x < 0:
			speed *= 2
		#add_constant_central_force(speed)
		apply_central_impulse(speed * delta)
		#$RayCast2D.rotation_degrees = rotation_degrees + 90
	elif Input.is_action_pressed("move_left"):
		grapple_rotation_degrees = 90
		if Input.is_action_pressed("grapple_up"):
			grapple_rotation_degrees += 45
		var speed = Vector2(DEFAULT_SPEED,0)
		if linear_velocity.x > 0:
			speed *= 2
		#add_constant_central_force(-speed)
		apply_central_impulse(-speed * delta)
	else:
		if Input.is_action_pressed("grapple_up"):
			grapple_rotation_degrees = 180
			
	
	if Input.is_action_just_pressed("jump"):
		if get_contact_count() > 0:
			print("jump")
			apply_central_impulse(Vector2(0,-500.0))
			
	# only create one grapple
	if Input.is_action_pressed("grapple"):
		add_grapple()
	else:
		
		#$PinJoint2D.node_b = null
		
#		https://forum.godotengine.org/t/how-exactly-remove-child-works/2842
		if is_instance_valid(pin_point):
			print("remove pin_point")
			pin_point.queue_free()

		pass
		
	
		
	pass
