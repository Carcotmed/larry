extends State

@export var idle_state: State
@export var jumping_state: State
@export var running_state: State

@onready var sprite: AnimatedSprite2D = %Sprite
@onready var landing_sound: AudioStreamPlayer2D = %LandingSound

func enter():
	sprite.play("jumping")
	
func exit():
	landing_sound.play()

func process_physics(delta: float) -> State:
	parent.velocity.y += Constants.gravity * delta
	
	var movement = Input.get_axis('Move Left', 'Move Right') * Constants.player_move_speex
	
	if movement != 0:
		parent.sprite.flip_h = movement < 0
		
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if movement != 0:
			return running_state
		return idle_state
	
	return null
