extends State

@onready var sprite: AnimatedSprite2D = %Sprite

func enter():
	sprite.play("flying")
	
func process_physics(_delta: float) -> State:
	var larry: Larry = get_tree().current_scene.find_child("Larry")
	
	var direction: Vector2 = larry.global_position - parent.global_position
	var movement: Vector2 = direction.normalized() * Constants.bat_acceleration
	
	parent.velocity += movement * _delta
	parent.velocity = parent.velocity.limit_length(Constants.bat_top_velocity)
	parent.move_and_slide()
	
	return null
