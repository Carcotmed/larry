extends RigidBody2D
class_name Bubble

@onready var sprite: AnimatedSprite2D = $Sprite
@onready var contact_await_timer: Timer = $ContactAwaitTimer
@onready var contact_hitbox: Area2D = $ContactHitbox
@onready var expiration_timer: Timer = $ExpirationTimer
@onready var almost_expiration_timer: Timer = $AlmostExpirationTimer

func _process(_delta: float) -> void:
	pass

#func _physics_process(delta: float) -> void:
	#sprite.rotation = - self.rotation

func _on_contact_hitbox_body_entered(body: Node2D) -> void:
	body._on_bubble_touched()
	
	if body is Larry:
		sprite.play("pop")
		await sprite.animation_finished
		
	self.queue_free()


func _on_contact_await_timer_timeout() -> void:
	contact_hitbox.set_collision_mask_value(2, true)


func _on_almost_expiration_timer_timeout() -> void:
	sprite.play("expiring")
	expiration_timer.start()

func _on_expiration_timer_timeout() -> void:
	sprite.play("pop")
	await sprite.animation_finished
	self.queue_free()
