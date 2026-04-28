extends CharacterBody2D

@onready var state_machine: StateMachine = %StateMachine
@onready var sprite: AnimatedSprite2D = %Sprite

@onready var dead_state: Node = $StateMachine/DeadState
@onready var dead_timer: Timer = %DeadTimer

var input_stack: Array[InputEvent]

func _ready() -> void:
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func _on_water_body_entered(body: Node2D) -> void:
	if (state_machine.current_state != dead_state):
		state_machine.change_state(dead_state)
		GameManager.on_death()
