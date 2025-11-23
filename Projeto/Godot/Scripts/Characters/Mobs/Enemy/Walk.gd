extends EnemyState

func _begin_update() -> void:
	if character.sprite:
		character.sprite.play("Walk")

func _update(delta: float) -> void:
	if enemy_collided(): state_machine.state_changer("hit"); return
	if death(): state_machine.state_changer("death"); return
	if not(on_ground()): state_machine.state_changer("fall"); return
	if stopped(): state_machine.state_changer("idle"); return
	flip_sprite_x()

func _physics_update(delta: float) -> void:
	if character.velocity.x == 0:
		character.direction *= -1
	character.velocity.x = character.move(character.speed, 10., delta).x
	character.move_and_slide()

func _end_update() -> void:
	pass
