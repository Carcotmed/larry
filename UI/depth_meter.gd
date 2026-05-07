extends Control

@export var start_marker: Marker2D
@export var end_marker: Marker2D
@export var character: CharacterBody2D

@onready var progress_bar: ProgressBar = %ProgressBar
@onready var character_icon: TextureRect = %CharacterIcon

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var total_height: float = end_marker.position.y - start_marker.position.y
	var current_character_height: float = character.position.y - start_marker.position.y
	progress_bar.value = current_character_height / total_height * 100

	var icon_y_pos = progress_bar.size.y * progress_bar.value / 100
	
	character_icon.position.x = (progress_bar.size.x / 2) - (character_icon.size.x / 2)
	character_icon.position.y = progress_bar.size.y - character_icon.size.y - icon_y_pos
