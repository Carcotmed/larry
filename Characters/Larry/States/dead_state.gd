extends State

@onready var sprite: AnimatedSprite2D = %Sprite

func enter():
	sprite.play("dead")
	parent.velocity.y = -200
	parent.velocity.x = 0
	
func process_physics(delta: float) -> State:
	parent.velocity.y += Constants.gravity * delta
	
	if parent.velocity.y < 0:
		sprite.flip_v = true
	
	parent.move_and_slide()

	return null
