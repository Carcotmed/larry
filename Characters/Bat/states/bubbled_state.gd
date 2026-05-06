extends State

@onready var sprite: AnimatedSprite2D = %Sprite
@onready var bubbled_timer: Timer = $BubbledTimer
@onready var bounce_area: Area2D = %BounceArea
@onready var damage_component: DamageComponent = %DamageComponent

@export var chasing_state: State

var change_to_chasing: bool

func enter():
	sprite.play("bubbled")
	bubbled_timer.start()
	change_to_chasing = false
	bounce_area.monitoring = true
	damage_component.monitoring = false
	parent.velocity.x *= .7
	
func exit():
	bounce_area.monitoring = false
	damage_component.monitoring = true
	
func process_frame(_delta: float) -> State:
	if change_to_chasing:
		return chasing_state
	return null
	
func process_physics(_delta: float) -> State:
	parent.velocity.y += -Constants.gravity * 0.1 * _delta
	parent.move_and_slide()
	return null

func _on_bounce_area_body_entered(body: Node2D) -> void:
	if body is Larry:
		body._on_bubbled_thing_touched()
		sprite.play("pop")
		await sprite.animation_finished
		parent.queue_free()

func _on_bubbled_timer_timeout() -> void:
	change_to_chasing = true
