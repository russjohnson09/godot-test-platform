extends Path2D

@export var speed = 1.0


var direction = 1

func _process(delta: float) -> void:
	loop_movement(delta)

func loop_movement(delta):
	$PathFollow2D.progress_ratio += delta * speed * direction
	
	if $PathFollow2D.progress_ratio >= 1.0:
		direction = -1
	elif $PathFollow2D.progress_ratio <= 0.0:
		direction = 1
	
