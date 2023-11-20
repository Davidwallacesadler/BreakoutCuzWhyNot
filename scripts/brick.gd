class_name Brick extends StaticBody2D

@export var color: BrickColor = BrickColor.RED

# Maybe make static? They are all the same...
@export var width: float = 200
@export var height: float = 100

@export var sprite: Sprite2D
@export var collision_shape: CollisionShape2D


func setup():
	# Scale sprite
	var sprite_scale_factor = _get_sprite_scale_factor(width, height)
	sprite.scale *= sprite_scale_factor
	
	# Setup collision shape:
	collision_shape.shape = RectangleShape2D.new()
	collision_shape.shape.size.x = width
	collision_shape.shape.size.y = height
	

func hit() -> void:
	GameEvents.brick_hit.emit()
	queue_free.call_deferred()
	

func _get_sprite_scale_factor(width: float, height: float) -> Vector2:
	var current_size = sprite.get_rect().size
	
	var x_scale_factor = width / current_size.x
	var y_scale_factor = height / current_size.y
	
	return Vector2(x_scale_factor, y_scale_factor)
	

enum BrickColor {
	RED, YELLOW, GREEN, BLUE, VIOLET
}
