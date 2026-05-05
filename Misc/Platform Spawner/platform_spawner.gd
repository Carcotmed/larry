extends Area2D

@export var platform_scene: PackedScene
@export var spawnable_objects: Array[PackedScene]
@export var entities_container: Node
@export var platforms_container: Node
@onready var spawn_area: CollisionShape2D = $SpawnArea

@onready var visible_on_screen_notifier_2d: VisibleOnScreenNotifier2D = $VisibleOnScreenNotifier2D

var spawning = false
var rng = RandomNumberGenerator.new()

func _ready() -> void:
	rng.randomize()
	
func _process(_delta: float) -> void:
	if spawning:
		var shape: RectangleShape2D = spawn_area.shape
		self.position.y -= shape.size.y
		spawn_platforms(rng.randi_range(1, 3))
	
func spawn_platforms(quantity: int) -> void:
	var spawned_platforms: Array[Platform] = []
		
	for i in range(quantity):		
		var platform_instance: Platform = platform_scene.instantiate()
		platforms_container.add_child(platform_instance)
		var valid_position = false
		
		while !valid_position:
			valid_position = true
			
			var spawn_area_shape := spawn_area.shape as RectangleShape2D
			var spawn_area_transform := spawn_area.global_transform
			var extents := spawn_area_shape.size * 0.5

			var local_pos = Vector2(
				rng.randf_range(-extents.x, extents.x),
				rng.randf_range(-extents.y, extents.y)
			)

			platform_instance.global_position = spawn_area_transform * local_pos
			if spawned_platforms.is_empty():
				spawned_platforms.append(platform_instance)
				break
			else:
				for platform in spawned_platforms:
					valid_position = platform.position.distance_to(platform_instance.position) > Constants.distance_between_platforms
					if !valid_position:
						break
					
				if valid_position:
					spawned_platforms.append(platform_instance)
				
	prints("Spawned ", spawned_platforms.size(), " platforms")
	for platform: Platform in spawned_platforms:
		if rng.randi_range(1, 6) == 6:
			var object_to_spawn: PackedScene = spawnable_objects[rng.randi_range(0, spawnable_objects.size()-1)]
			var object_instance: PhysicsBody2D = object_to_spawn.instantiate()
			entities_container.add_child(object_instance)
			object_instance.global_position = Vector2(platform.global_position.x, platform.global_position.y - 20)
	
func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	spawning = true
	
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	spawning = false
