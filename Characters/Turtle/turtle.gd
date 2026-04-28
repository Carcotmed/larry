extends CharacterBody2D

@onready var state_machine: StateMachine = $StateMachine

func _ready() -> void:
	state_machine.init(self)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
