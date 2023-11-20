extends Node2D

@export var player: CharacterBody2D
@export var ball: RigidBody2D

func _ready():
	_serve_ball()
	

func _serve_ball() -> void:
	ball.apply_impulse(Vector2(-100, -300))
	
