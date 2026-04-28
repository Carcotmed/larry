extends Marker2D

@onready var bubble_gun_sprite: Sprite2D = %BubbleGunSprite

@onready var larry: CharacterBody2D = $".."
@onready var state_machine: StateMachine = %StateMachine
@onready var larry_sprite: AnimatedSprite2D = %Sprite
@onready var idle_state: Node = $"../StateMachine/IdleState"

func _unhandled_input(event: InputEvent) -> void:
	if !GameManager.paused && event is InputEventMouseMotion:
		look_at(get_global_mouse_position())
		
		if self.global_rotation_degrees > 90 || self.global_rotation_degrees < -90 :
			self.z_index = -1
			bubble_gun_sprite.flip_v = true
			
			if state_machine.current_state == idle_state:
				larry_sprite.flip_h = true
		else:
			self.z_index = 1
			bubble_gun_sprite.flip_v = false
			
			if state_machine.current_state == idle_state:
				larry_sprite.flip_h = false
			
		if larry.is_on_floor():
			if self.global_rotation_degrees > 0:
				if self.global_rotation_degrees > 90:
					self.rotation_degrees = -180
				else:
					self.rotation_degrees = 0
