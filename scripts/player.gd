extends CharacterBody2D

@export var max_speed: float = 425
@export var acceleration: float = 75
@export var friction: float = 25

func _physics_process(delta):
	var x_movement_direction = Input.get_axis("ui_left", "ui_right")
	
	if x_movement_direction == 0:
		self.velocity.x = move_toward(velocity.x, 0, friction)
	else:
		var x_target_velocity = x_movement_direction * max_speed
		self.velocity.x = move_toward(velocity.x, x_target_velocity, acceleration)
	
	self.move_and_slide()
	
