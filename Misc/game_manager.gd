extends Node

var paused: bool = false
var dead: bool = false

var pause_menu_scene = preload("res://Menus/PauseMenu/pause_menu.tscn")
var pause_menu_instance: Control

var results_menu_scene = preload("res://Menus/ResultMenu/result_menu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://game.tscn")

func on_pause_pressed() -> void:
	if !dead:
		if paused:
			pause_menu_instance.queue_free()
			paused = false
		else:
			pause_menu_instance = pause_menu_scene.instantiate()
			get_tree().current_scene.add_child(pause_menu_instance)
			paused = true

func on_death() -> void:
	dead = true
	await get_tree().create_timer(1).timeout
	var results_menu_instance = results_menu_scene.instantiate()
	get_tree().current_scene.add_child(results_menu_instance)
	paused = true
	
func on_exit_to_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Menus/TitleScreen/titleScreen.tscn")
