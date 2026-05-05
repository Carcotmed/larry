extends State

@export var idle_state: State
@export var running_state: State
@export var falling_state: State

@onready var sprite: AnimatedSprite2D = %Sprite
@onready var super_jump_sound: AudioStreamPlayer2D = $SuperJumpSound

func enter():
	sprite.play("jumping")
	super_jump_sound.play()
	parent.velocity.y = -Constants.player_jump_force * Constants.bubble_jump_multiplier

func process_physics(delta: float) -> State:
	parent.velocity.y += Constants.gravity * delta
	
	if (parent.velocity.y > 0):
		return falling_state
		
	
	var movement = Input.get_axis('Move Left', 'Move Right') * Constants.player_move_speed
	
	if movement != 0:
		parent.sprite.flip_h = movement < 0
		
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if movement != 0:
			return running_state
		return idle_state
	
	return null
