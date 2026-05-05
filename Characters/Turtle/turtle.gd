extends CharacterBody2D
class_name Turtle

@onready var state_machine: StateMachine = $StateMachine
@export var bubbled_state: State

func _ready() -> void:
	state_machine.init(self)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	
func _process(delta: float) -> void:
	state_machine.process_frame(delta)
	
func _on_bubble_touched() -> void:
	state_machine.change_state(bubbled_state)
