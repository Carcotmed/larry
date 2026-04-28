extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _on_play_button_pressed() -> void:
	GameManager.on_play_button_pressed()
