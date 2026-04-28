extends RigidBody2D

@onready var sprite: AnimatedSprite2D = $Sprite
@onready var contact_await_timer: Timer = $ContactAwaitTimer
@onready var contact_hitbox: Area2D = $ContactHitbox

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	sprite.rotation = - self.rotation

func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body.name)
	if body is Larry:
		body._on_bubble_touched()
		sprite.play("pop")
		await sprite.animation_finished
		self.queue_free()


func _on_contact_await_timer_timeout() -> void:
	contact_hitbox.monitoring = true
