extends EnemyState
func _begin_update() -> void:
	enemy.sprite.play("Hit")
	enemy.hp -= 1
	enemy.velocity = Vector2.ZERO
	enemy.velocity = Vector2(-enemy.knockback_dir * enemy.knockback_force.x, enemy.knockback_force.y)

func _update(delta: float) -> void:
	pass

func _physics_update(delta: float) -> void:
	enemy.apply_gravity(delta)
	enemy.move_and_slide()

func _end_update() -> void:
	pass
