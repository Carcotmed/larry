extends Area2D
class_name DamageComponent

func _on_area_entered(area: Area2D) -> void:
	if area is HurtboxComponent:
		area.entity.hurt()
