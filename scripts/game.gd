extends Node2D

@export var player: CharacterBody2D
@export var ball: RigidBody2D
@export var ball_death_area: Area2D
@export var brick_grid: Node2D
@export var score_label: Label
@export var lives_label: Label

var _has_served := false

var _initial_ball_position: Vector2
var _initial_grid_position: Vector2

var _score := 0
var _lives := 3

const _ball_scene = preload("res://scenes/ball.tscn")
const _brick_grid_scene = preload("res://scenes/brick_grid.tscn")

func _ready():
	GameEvents.brick_hit.connect(_on_brick_hit)
	ball_death_area.body_entered.connect(_on_ball_killed)
	
	_initial_ball_position = ball.position
	_initial_grid_position = brick_grid.position
	
	_update_score_label()
	_update_lives_label()
	

func _input(event):
	if event.is_action_pressed("ui_accept") and not _has_served:
		_serve_ball()
		_has_served = true
	

func _on_brick_hit() -> void:
	_score += 100
	_update_score_label()
	

func _on_ball_killed(body: Node2D) -> void:
	_lives -= 1
	
	if _lives == 0:
		_reset_game.call_deferred()
		
	_update_lives_label()
	_reset_ball.call_deferred()
	

func _update_lives_label() -> void:
	var lives_text = "Lives: "
	for i in _lives:
		lives_text += "•"
	lives_label.text = lives_text
	

func _update_score_label() -> void:
	var score_text = "Score: %s"
	score_label.text = score_text % _score
	

func _reset_ball() -> void:
	ball.queue_free()
	ball = _ball_scene.instantiate()
	add_child(ball)
	ball.position = _initial_ball_position
	_has_served = false
	

func _reset_game() -> void:
	_score = 0
	_lives = 3
	
	brick_grid.queue_free()
	brick_grid = _brick_grid_scene.instantiate()
	add_child(brick_grid)
	brick_grid.position = _initial_grid_position
	
	_update_score_label()
	_update_lives_label()

func _serve_ball() -> void:
	var serve_speed := 500.0
	
	var rng = RandomNumberGenerator.new()
	var random_x = rng.randf_range(-1, 1)
	var random_direction = Vector2(random_x, -1).normalized()
	
	ball.apply_impulse(random_direction * serve_speed)
	

