extends Control

func _on_restart_button_pressed() -> void:
	GameManager.on_play_button_pressed()

func _on_exit_button_pressed() -> void:
	GameManager.on_exit_to_menu_button_pressed()
