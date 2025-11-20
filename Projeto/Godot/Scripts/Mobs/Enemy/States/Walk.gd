extends EnemyState

func _begin_update() -> void:
	if enemy.sprite:
		enemy.sprite.play("Walk")

func _update(delta: float) -> void:
	if death(): state_machine.state_changer("death")
	if not(on_ground()): state_machine.state_changer("fall")
	if stopped(): state_machine.state_changer("idle")
	flip_sprite_x()

func _physics_update(delta: float) -> void:
	if enemy.velocity.x == 0:
		enemy.direction *= -1
	enemy.velocity.x = enemy.move(enemy.speed, 10., delta).x
	enemy.move_and_slide()

func _end_update() -> void:
	pass
