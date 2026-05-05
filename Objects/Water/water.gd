extends Area2D
	
func _physics_process(_delta: float) -> void:
	if !GameManager.paused:
		#self.position.y -= Constants.water_level_speed * delta
		pass
