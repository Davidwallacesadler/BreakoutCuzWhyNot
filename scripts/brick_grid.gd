extends Node

@export var width: float = 575
@export var height: float = 250
@export var items_per_row: int = 8
@export var item_spacing: float = 0
@export var row_count: int = 5
@export var row_spacing: float = 16

const _brick_row_scene = preload("res://scenes/brick_row.tscn")

func _ready():
	_setup()
	

func _setup() -> void:
	var total_spacing = row_spacing * (row_count - 1)
	var total_row_height = height - total_spacing
	var single_row_height = total_row_height / row_count
	
	var current_row_position = Vector2.ZERO
	
	for i in row_count:
		var brick_row = _brick_row_scene.instantiate()
		
		brick_row.width = width
		brick_row.height = single_row_height
		brick_row.count = items_per_row
		brick_row.spacing = item_spacing
		brick_row.brick_color = i
		
		add_child(brick_row)
		
		brick_row.position = current_row_position
		current_row_position.y += single_row_height + row_spacing
