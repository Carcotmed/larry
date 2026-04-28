extends Node2D

@onready var muzzle: Marker2D = $Muzzle
@onready var shoot_sound: AudioStreamPlayer2D = $ShootSound
@onready var shoot_cooldown: Timer = $ShootCooldown

@export var bubble: PackedScene

var on_cooldown: bool = false

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_pressed("Shoot") && !on_cooldown:
		var bubble_instance: RigidBody2D = bubble.instantiate()
		get_tree().current_scene.add_child(bubble_instance)
		bubble_instance.global_position = muzzle.global_position
		bubble_instance.linear_velocity = Vector2(cos(self.global_rotation), sin(self.global_rotation)).normalized() * Constants.bubble_shoot_speed
		
		print(self.global_rotation)
		
		shoot_sound.play()
		shoot_cooldown.start()
		on_cooldown = true

func _on_shoot_cooldown_timeout() -> void:
	on_cooldown = false
	
