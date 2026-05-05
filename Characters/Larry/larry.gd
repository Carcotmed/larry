extends CharacterBody2D
class_name Larry

@onready var state_machine: StateMachine = %StateMachine
@onready var sprite: AnimatedSprite2D = %Sprite

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
		if (state_machine.current_state != dead_state):
			state_machine.change_state(dead_state)
			GameManager.on_death()
		
func _on_bubble_touched() -> void:
	state_machine.change_state(jumping_state)
	
func _on_bubbled_thing_touched() -> void:
	state_machine.change_state(super_jumping_state)
