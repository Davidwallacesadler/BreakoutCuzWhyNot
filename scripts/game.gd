extends Node2D

@export var player: CharacterBody2D
@export var ball: RigidBody2D

func _ready():
	GameEvents.brick_hit.connect(_on_brick_hit)
	_serve_ball()
	

func _on_brick_hit() -> void:
	print("Brick hit")

func _serve_ball() -> void:
	ball.apply_impulse(Vector2(100, -300))
	
