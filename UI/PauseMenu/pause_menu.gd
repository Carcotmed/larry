extends Control

func _on_resume_button_pressed() -> void:
	GameManager.on_pause_pressed()

func _on_exit_button_pressed() -> void:
	GameManager.on_exit_to_menu_button_pressed()
