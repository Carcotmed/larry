extends CharacterBody2D

func _physics_process(delta: float) -> void:
	self.velocity.y += -Constants.bubble_float_speed * delta
	move_and_slide()
