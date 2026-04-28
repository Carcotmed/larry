extends State

@export var jumping_state: State
@export var running_state: State
@export var falling_state: State

@onready var sprite: AnimatedSprite2D = %Sprite

func enter():
	sprite.play("idle")
	parent.velocity.x = 0

func process_input(event: InputEvent) -> State:
	if Input.is_action_pressed("Jump") and parent.is_on_floor():
		return jumping_state
		
	if Input.get_axis('Move Left', 'Move Right'):
		return running_state
		
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += Constants.gravity * delta
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return falling_state
	return null
