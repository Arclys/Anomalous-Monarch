extends EnemyState


func _begin_update() -> void:
	Master.play_audio("warm_hurt", 0.85, 1.)
	character.sprite.play("Hit")
	take_damage(1)
	character.velocity = Vector2.ZERO
	character.velocity = Vector2(-character.knockback_dir * character.knockback_force.x, character.knockback_force.y)

func _update(delta: float) -> void:
	if death(): state_machine.state_changer("death")
	if on_ground(): state_machine.state_changer("idle")

func _physics_update(delta: float) -> void:
	character.apply_gravity(delta)
	character.move_and_slide()

func _end_update() -> void:
	pass
