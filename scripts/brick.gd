class_name Brick extends StaticBody2D

@export var color: BrickColor = BrickColor.RED

@export var width: float = 200
@export var height: float = 100

@export var sprite: Sprite2D
@export var collision_shape: CollisionShape2D

const shader = preload("res://assets/color.gdshader")

func _ready():
	_setup()

func _setup():
	# Scale sprite
	var sprite_scale_factor = _get_sprite_scale_factor(width, height)
	sprite.scale *= sprite_scale_factor
	
	# Setup collision shape:
	collision_shape.shape = RectangleShape2D.new()
	collision_shape.shape.size.x = width
	collision_shape.shape.size.y = height
	
	var brick_color = Vector3.ONE
	match (color):
		BrickColor.RED:
			brick_color = Vector3(1, 0.25, 0.25)
		BrickColor.YELLOW:
			brick_color = Vector3(0.9, 0.7, 0.05)
		BrickColor.GREEN:
			brick_color = Vector3(0.07, 0.9, 0.15)
		BrickColor.BLUE:
			brick_color = Vector3(0.07, 0.15, 0.9)
		BrickColor.VIOLET:
			brick_color = Vector3(0.65, 0.15, 0.9)
	
	var material = ShaderMaterial.new()
	material.shader = shader
	material.set_shader_parameter("color", brick_color)
	sprite.material = material
	
	
	

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
