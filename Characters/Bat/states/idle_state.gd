extends State

@export var chasing_state: State
var change_to_chasing: bool = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func process_frame(_delta: float) -> State:
	if change_to_chasing:
		return chasing_state
	return null

func _on_trigger_zone_body_entered(body: Node2D) -> void:
	if body is Larry:
		change_to_chasing = true
