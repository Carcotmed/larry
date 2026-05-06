extends CharacterBody2D
class_name Larry

@onready var state_machine: StateMachine = %StateMachine
@onready var sprite: AnimatedSprite2D = %Sprite
@onready var hitbox: CollisionShape2D = %Hitbox
@onready var hurt_sound: AudioStreamPlayer2D = %HurtSound

@export var dead_state: State
@export var jumping_state: State
@export var super_jumping_state: State

func _ready() -> void:
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func _on_water_body_entered(body: Node2D) -> void:
	if body is Larry:
		hurt()
		
func _on_bubble_touched() -> void:
	state_machine.change_state(jumping_state)
	
func _on_bubbled_thing_touched() -> void:
	state_machine.change_state(super_jumping_state)
	
func hurt() -> void:
	if (state_machine.current_state != dead_state):
		self.set_collision_mask_value(3, false)
		self.set_collision_layer_value(2, false)
		state_machine.change_state(dead_state)
		hurt_sound.play()
		GameManager.on_death()
