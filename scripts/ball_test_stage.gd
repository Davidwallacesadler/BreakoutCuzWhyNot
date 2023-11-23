extends Node2D

@export var ball: Area2D

@export var left_wall: StaticBody2D
@export var top_wall: StaticBody2D
@export var right_wall: StaticBody2D
@export var bottom_wall: StaticBody2D

@export var debug_label: Label

var _ball_speed := 75.0
var _ball_direction := Vector2(-1,-1)

var _last_hit_wall: StaticBody2D
var _last_direction_change: Direction

func _ready():
	ball.body_entered.connect(_on_collision)
	_update_debug_label()
	

func _physics_process(delta):
	var ball_velocity = _ball_direction * _ball_speed
	ball.position += ball_velocity * delta
	

func _update_debug_label():
	var str = "(x, %s, y, %s)"
	var x = _ball_direction.x
	var y = _ball_direction.y
	debug_label.text = str % [x, y]

func _on_collision(body: Node2D) -> void:
	if body as Brick:
		body.hit()
#		_ball_speed += 10
		match _last_hit_wall:
			left_wall:
				_ball_direction.x *= -1
			top_wall:
#				_ball_direction.x *= -1
				_ball_direction.y *= -1
			bottom_wall:
				_ball_direction.y *= -1
			right_wall:
				_ball_direction.x *= -1
		_update_debug_label()
		return
	_last_hit_wall = body
	match body:
		left_wall:
			_ball_direction.x = 1
			_last_direction_change = Direction.X
		top_wall:
			_ball_direction.y = 1
			_last_direction_change = Direction.Y
		bottom_wall:
			_ball_direction.y = -1
			_last_direction_change = Direction.Y
		right_wall:
			_ball_direction.x = -1
			_last_direction_change = Direction.X
	_update_debug_label()
	

enum Direction {
	X, Y
}
