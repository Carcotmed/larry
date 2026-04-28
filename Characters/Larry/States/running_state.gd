extends State

@export var idle_state: State
@export var jumping_state: State
@export var falling_state: State

@onready var sprite: AnimatedSprite2D = %Sprite

func enter():
	sprite.play("running")
	
func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("Jump") and parent.is_on_floor():
		return jumping_state
	return null

func process_physics(delta: float) -> State:
	var movement = Input.get_axis('Move Left', 'Move Right') * Constants.player_move_speed
	
	if movement == 0:
		return idle_state
	
	parent.sprite.flip_h = movement < 0
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return falling_state
	
	return null
