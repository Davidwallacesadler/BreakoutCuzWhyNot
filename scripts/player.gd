extends CharacterBody2D

const MAX_SPEED: float = 350
const ACCELERATION: float = 75
const FRICTION: float = 25

func _physics_process(delta):
	var x_movement_direction = Input.get_axis("ui_left", "ui_right")
	
	if x_movement_direction == 0:
		self.velocity.x = move_toward(velocity.x, 0, FRICTION)
	else:
		var target_velocity = x_movement_direction * MAX_SPEED
		self.velocity.x = move_toward(velocity.x, target_velocity, ACCELERATION)
	
	self.move_and_slide()
	
