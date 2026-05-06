extends CharacterBody2D
class_name BatEnemy

@onready var state_machine: StateMachine = %StateMachine
@onready var sprite: AnimatedSprite2D = %Sprite

@export var bubbled_state: State

func _ready() -> void:
	self.add_to_group("enemies")
	state_machine.init(self)

func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)

func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func _on_bubble_touched() -> void:
	state_machine.change_state(bubbled_state)
