extends Node2D

func _ready() -> void:
	GameManager.paused = false
	GameManager.dead = false

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("Pause"):
		GameManager.on_pause_pressed()
