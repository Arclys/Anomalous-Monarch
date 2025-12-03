extends EnemyState


func _begin_update() -> void:
	if character.sprite:
		character.sprite.play("Idle")

func _update(delta: float) -> void:
	if enemy_collided(): state_machine.state_changer("hit")
	if walking(): state_machine.state_changer("walk")
	if not(on_ground()): state_machine.state_changer("fall")

func _physics_update(delta: float) -> void:
	pass

func _end_update() -> void:
	pass
