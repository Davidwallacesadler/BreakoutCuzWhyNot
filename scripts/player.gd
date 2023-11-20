extends CharacterBody2D

const MAX_SPEED: float = 400
const ACCELERATION: float = 75
const FRICTION: float = 25

func _physics_process(delta):
	var input_direction = Input.get_axis("ui_left", "ui_right")
	
	if input_direction == 0:
		self.velocity.x = move_toward(velocity.x, 0, FRICTION)
	else:
		var target_velocity = MAX_SPEED * input_direction
		self.velocity.x = move_toward(velocity.x, target_velocity, ACCELERATION)
	
	self.move_and_slide()
	

func _magnitude(value: float) -> float:
	if value < 0:
		return -value
	return value
