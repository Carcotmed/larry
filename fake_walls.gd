extends TileMapLayer
class_name FakeWalls

func _on_fake_wall_entered() -> void:
	self.hide()
	
func _on_fake_wall_exited() -> void:
	self.show()
