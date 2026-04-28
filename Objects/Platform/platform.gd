extends CharacterBody2D

func _physics_process(delta: float) -> void:
	self.position.y += Constants.water_level_speed * delta
