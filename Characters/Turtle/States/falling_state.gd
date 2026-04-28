extends State

@onready var sprite: AnimatedSprite2D = %Sprite

@export var walking_state: State

func enter() -> void:
	sprite.play("falling")
	
func process_physics(delta: float) -> State:
	
	parent.velocity.y += Constants.gravity * delta
	
	parent.move_and_slide()
	
	if parent.is_on_floor():
		return walking_state
		
	return null
