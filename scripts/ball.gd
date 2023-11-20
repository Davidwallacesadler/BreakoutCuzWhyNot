extends RigidBody2D

func _ready():
	body_entered.connect(_on_collision)
	

func _on_collision(body: Node2D) -> void:
	if body.has_method("hit"):
		body.hit()
	
