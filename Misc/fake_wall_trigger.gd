extends Area2D
class_name FakeWallTrigger

var fake_walls: FakeWalls

func _ready() -> void:
	fake_walls = self.get_parent()

func _on_body_entered(body: Node2D) -> void:
	fake_walls._on_fake_wall_entered()

func _on_body_exited(body: Node2D) -> void:
	fake_walls._on_fake_wall_exited()
