extends Node
class_name StateMachine

@export var parent: Node
@export var initial_state: State

var current_state: State

func init(parent: CharacterBody2D) -> void:
	for child in get_children():
		child.parent = parent
		
	change_state(initial_state)
	
func change_state(new_state: State) -> void:
	if current_state:
		current_state.exit()
		
	#prints("Current state: ", current_state, ", new state: ", new_state)
		
	current_state = new_state
	new_state.enter()
	
func process_physics(delta: float) -> void:
	if !GameManager.paused:
		var new_state = current_state.process_physics(delta)
		if new_state:
			change_state(new_state)
		
func process_input(event: InputEvent) -> void:
	if !GameManager.paused:
		var new_state = current_state.process_input(event)
		if new_state:
			change_state(new_state)
		
func process_frame(delta: float) -> void:
	if !GameManager.paused:
		var new_state = current_state.process_frame(delta)
		if new_state:
			change_state(new_state)
