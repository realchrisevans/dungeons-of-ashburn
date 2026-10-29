extends CharacterBody2D

@export var move_speed: float = 220.0
@export var jump_speed: float = 420.0
@export var gravity: float = 1200.0


func _physics_process(delta: float) -> void:
	# Apply gravity while the player is in the air.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Jump only when touching the floor.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_speed

	# Read left and right input.
	var direction := Input.get_axis("move_left", "move_right")
	velocity.x = direction * move_speed

	# Move while checking for collisions.
	move_and_slide()
	
		# Return to the starting position after falling below the room.
	if global_position.y > 700.0:
		global_position = Vector2(160.0, 350.0)
		velocity = Vector2.ZERO
