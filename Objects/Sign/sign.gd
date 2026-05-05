extends Area2D

@onready var nine_patch_rect: NinePatchRect = $Control/NinePatchRect
@onready var label: Label = $Control/MarginContainer/Label
@onready var letter_timer: Timer = %LetterTimer
@onready var control: Control = $Control

@export var text: String

func _ready() -> void:
	label.text = ""
	nine_patch_rect.hide()
	control.show()

func _on_body_entered(body: Node2D) -> void:
	if body is Larry:
		nine_patch_rect.show()
		letter_timer.start()

func _on_body_exited(body: Node2D) -> void:
	letter_timer.stop()
	label.text = ""
	nine_patch_rect.hide()

func _on_letter_timer_timeout() -> void:
	var current_letter_count: int = label.text.length()
	if current_letter_count != text.length():
		label.text = text.substr(0, current_letter_count + 1)
	else:
		letter_timer.stop()
