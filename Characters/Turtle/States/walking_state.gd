extends State

@onready var sprite: AnimatedSprite2D = %Sprite
@onready var ray_cast_down_right: RayCast2D = %RayCastDownRight
@onready var ray_cast_down_left: RayCast2D = %RayCastDownLeft
@onready var ray_cast_right: RayCast2D = %RayCastRight
@onready var ray_cast_left: RayCast2D = %RayCastLeft

@export var falling_state: State

var orientation = 1

func enter():
	sprite.play("walking")

func process_physics(_delta: float) -> State:
	if orientation == 1 && (!ray_cast_down_right.is_colliding() or ray_cast_right.is_colliding()):
		orientation = -1	
	elif orientation == -1 && (!ray_cast_down_left.is_colliding() or ray_cast_left.is_colliding()):
		orientation = 1
	
	sprite.flip_h = orientation > 0
	parent.velocity.x = Constants.turtle_walking_speed * orientation
	parent.move_and_slide()

	if !parent.is_on_floor():
		return falling_state
	
	return null
