extends StaticBody2D

@onready var sprite: AnimatedSprite2D = $Sprite
@onready var bounce_hitbox: Area2D = $BounceHitbox
@onready var bubbled_duration: Timer = $BubbledDuration

func _on_bubble_touched() -> void:
	sprite.play("bubbled")
	bounce_hitbox.monitoring = true
	bubbled_duration.start()

func _on_bounce_hitbox_body_entered(body: Node2D) -> void:
	if body is Larry:
		body._on_bubbled_thing_touched()
		bounce_hitbox.set_deferred("monitoring", false)
		sprite.play("default")
		bubbled_duration.stop()

func _on_bubbled_duration_timeout() -> void:
	sprite.play("default")
	bounce_hitbox.monitoring = false
