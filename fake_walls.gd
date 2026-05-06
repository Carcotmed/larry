extends TileMapLayer
class_name FakeWalls

func _on_fake_wall_entered() -> void:
	var tween = get_tree().create_tween()
	#tween.set_ease(Tween.EASE_IN)
	tween.tween_property(self, "modulate:a", 0, .33)
	
func _on_fake_wall_exited() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate:a", 1, .33)
