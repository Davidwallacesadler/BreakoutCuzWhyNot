extends Node

@export var width: float = 500
@export var height: float = 75
@export var count: int = 4
@export var spacing: float = 10
@export var brick_color: Brick.BrickColor = Brick.BrickColor.RED

const _brick_scene = preload("res://scenes/brick.tscn")

func _ready():
	var total_spacing = spacing * (count - 1)
	var total_brick_width = width - total_spacing
	var single_brick_width = total_brick_width / count
	
	var current_brick_position = Vector2.ZERO
	
	for i in count:
		var new_brick = _brick_scene.instantiate()
		new_brick.width = single_brick_width
		new_brick.height = height
		new_brick.setup()
		add_child(new_brick)
		new_brick.position = current_brick_position
		current_brick_position += Vector2(single_brick_width + spacing, 0)
	
	
	
	
	

